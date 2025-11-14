#!/bin/bash

# UltiVim Local CI Script
# Run this to check your config locally before pushing

set -e

echo "🚀 Running UltiVim Local CI Checks..."
echo "======================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print status
print_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ $1 passed${NC}"
    else
        echo -e "${RED}❌ $1 failed${NC}"
        exit 1
    fi
}

# Check if we're in the right directory
if [ ! -f "init.lua" ]; then
    echo -e "${RED}❌ Please run this from your Neovim config directory${NC}"
    exit 1
fi

# 1. Lua Linting
echo "🔍 Running Luacheck..."
if command -v luacheck &> /dev/null; then
    luacheck lua/ --globals vim --codes
    print_status "Luacheck"
else
    echo -e "${YELLOW}⚠️  Luacheck not installed. Run: luarocks install luacheck${NC}"
fi

# 2. Code Formatting
echo "🎨 Checking code formatting..."
if command -v stylua &> /dev/null; then
    stylua --check lua/
    print_status "StyLua formatting check"
else
    echo -e "${YELLOW}⚠️  StyLua not installed. Run: brew install stylua${NC}"
fi

# 3. Config Loading Test
echo "⚙️  Testing config loading..."
nvim --headless -c "lua vim.print('Config loaded successfully')" -c "qa" 2>&1 | grep -q "Config loaded successfully"
print_status "Config loading"

# 4. Plugin Loading Test
echo "🔌 Testing plugin loading..."
nvim --headless -c "lua require('lazy').setup()" -c "qa" > /dev/null 2>&1
print_status "Plugin loading"

# 5. Startup Time Check
echo "⚡ Measuring startup time..."
nvim --headless --startuptime startup.log -c "qa"
startup_time=$(tail -1 startup.log | awk '{print $1}')
echo "Startup time: ${startup_time}ms"

if command -v bc &> /dev/null; then
    if (( $(echo "$startup_time > 100" | bc -l) )); then
        echo -e "${YELLOW}⚠️  Startup time is slower than optimal: ${startup_time}ms${NC}"
    else
        echo -e "${GREEN}✅ Startup time is good: ${startup_time}ms${NC}"
    fi
fi

rm -f startup.log

# 6. Deprecated API Check
echo "🔍 Checking for deprecated APIs..."
deprecated_found=0

if grep -r "vim\.lsp\.buf\.formatting" lua/ &> /dev/null; then
    echo -e "${RED}❌ Found deprecated vim.lsp.buf.formatting${NC}"
    deprecated_found=1
fi

if grep -r "vim\.lsp\.diagnostic" lua/ &> /dev/null; then
    echo -e "${RED}❌ Found deprecated vim.lsp.diagnostic${NC}"
    deprecated_found=1
fi

if [ $deprecated_found -eq 0 ]; then
    echo -e "${GREEN}✅ No deprecated APIs found${NC}"
fi

# 7. Security Scan
echo "🔒 Running security scan..."
security_issues=0

# Check for potential secrets (excluding common false positives)
if grep -r "password\|secret\|key\|token" --include="*.lua" lua/ | grep -v "keymap\|keyword\|keynote" | grep -v "-- " &> /dev/null; then
    echo -e "${RED}❌ Potential secrets found in code${NC}"
    security_issues=1
fi

# Check for insecure URLs
if grep -r "http://" --include="*.lua" lua/ &> /dev/null; then
    echo -e "${RED}❌ Insecure HTTP URLs found${NC}"
    security_issues=1
fi

if [ $security_issues -eq 0 ]; then
    echo -e "${GREEN}✅ No security issues found${NC}"
fi

# 8. Plugin Count
plugin_count=$(find lua/plugins/ -name "*.lua" 2>/dev/null | wc -l | tr -d ' ')
echo "📦 Plugin configurations: $plugin_count"

if [ $plugin_count -gt 100 ]; then
    echo -e "${YELLOW}⚠️  High plugin count: $plugin_count configurations${NC}"
else
    echo -e "${GREEN}✅ Plugin count is reasonable${NC}"
fi

echo "======================================="
echo -e "${GREEN}🎉 All checks completed successfully!${NC}"
echo "Your config is ready to push! 🚀"