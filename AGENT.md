# UltiVim Agent Configuration

This file contains automated agent instructions for maintaining code quality,
refactoring, and setup management of the UltiVim Neovim configuration.

## 🤖 Agent Instructions

### Code Quality & Refactoring

#### Lua Code Standards

- **Indentation**: Maintain consistent tab indentation
- **Naming**: Use snake_case for variables and functions
- **Performance**: Optimize lazy loading and startup times
- **Memory**: Minimize resource usage and plugin conflicts
- **Error Handling**: Use pcall() for operations that might fail
- **Comments**: Remove unnecessary comments, keep only essential documentation

#### Plugin Management

- **Lazy Loading**: Ensure all plugins use appropriate events/conditions
- **Dependencies**: Explicitly declare and minimize dependencies
- **Conflicts**: Detect and resolve plugin conflicts automatically
- **Cleanup**: Remove unused or redundant plugins
- **Updates**: Keep plugins updated to latest stable versions

#### LSP Configuration

- **Server Management**: Optimize language server configurations
- **Capabilities**: Ensure proper capability declarations
- **Performance**: Minimize LSP overhead and startup impact
- **Settings**: Maintain optimal server-specific settings
- **Handlers**: Implement efficient diagnostic and hover handlers

### Setup & Installation

#### Prerequisites Check

```bash
# Verify Neovim version >= 0.9.0
nvim --version

# Check Node.js for LSP servers
node --version

# Verify Python for plugins
python3 -c "import pynvim"

# Check Git availability
git --version
```

#### Automated Setup Tasks

1. **Plugin Installation**: Auto-sync all plugins via Lazy.nvim
2. **LSP Servers**: Install required language servers via Mason
3. **Formatters**: Install formatters and linters via Mason
4. **Health Check**: Run comprehensive health checks
5. **Performance Test**: Verify startup time benchmarks

#### Configuration Validation

- **Syntax Check**: Validate all Lua configuration files
- **Key Conflicts**: Detect conflicting key mappings
- **Plugin Conflicts**: Identify incompatible plugin combinations
- **Performance**: Ensure startup time remains under 100ms
- **Functionality**: Verify core features work correctly

### Maintenance Tasks

#### Daily Maintenance

- Update plugin specifications
- Check for deprecated APIs
- Validate configuration integrity
- Monitor startup performance

#### Weekly Maintenance

- Review and optimize plugin loading
- Update language server configurations
- Clean unused dependencies
- Performance profiling and optimization

#### Monthly Maintenance

- Major plugin updates evaluation
- Configuration architecture review
- Performance baseline updates
- Documentation synchronization

### Quality Assurance

#### Code Review Checklist

- [ ] All plugins properly lazy-loaded
- [ ] No hardcoded paths or configurations
- [ ] Proper error handling implemented
- [ ] Key mappings follow consistent patterns
- [ ] LSP configurations optimized
- [ ] No unused code or comments
- [ ] Performance impact assessed
- [ ] Documentation updated if needed

#### Performance Benchmarks

- **Startup Time**: < 100ms
- **Memory Usage**: < 50MB initial
- **Plugin Load Time**: < 10ms per plugin
- **LSP Attach Time**: < 500ms
- **File Open Time**: < 50ms

#### Testing Matrix

```lua
-- Test different environments
local test_environments = {
    { os = "macOS", term = "iTerm2", shell = "zsh" },
    { os = "Linux", term = "alacritty", shell = "bash" },
    { os = "Windows", term = "Windows Terminal", shell = "pwsh" },
}

-- Test file types
local test_filetypes = {
    "typescript", "javascript", "go", "rust",
    "python", "lua", "vue", "html", "css"
}
```

### Refactoring Guidelines

#### Plugin Configurations

1. **Consolidation**: Merge related plugin configs
2. **Separation**: Split large configs into focused modules
3. **Standardization**: Use consistent configuration patterns
4. **Optimization**: Remove redundant settings and dependencies

#### Key Mapping Refactoring

1. **Grouping**: Organize by functional categories
2. **Consistency**: Standardize naming patterns
3. **Conflicts**: Resolve overlapping mappings
4. **Documentation**: Maintain up-to-date mapping tables

#### LSP Refactoring

1. **Server Optimization**: Remove unused server configurations
2. **Handler Efficiency**: Optimize diagnostic and completion handlers
3. **Capability Management**: Streamline client capabilities
4. **Performance**: Reduce LSP startup overhead

### Automation Scripts

#### Setup Validation

```lua
-- Validate configuration integrity
local function validate_config()
    local issues = {}

    -- Check for syntax errors
    local config_files = vim.fn.glob("lua/**/*.lua", true, true)
    for _, file in ipairs(config_files) do
        local ok = pcall(dofile, file)
        if not ok then
            table.insert(issues, "Syntax error in: " .. file)
        end
    end

    -- Check startup time
    local start_time = vim.fn.reltime()
    vim.cmd("silent! runtime plugin/**/*.vim")
    local startup_time = vim.fn.reltimefloat(vim.fn.reltime(start_time)) * 1000

    if startup_time > 100 then
        table.insert(issues, "Startup time exceeds 100ms: " .. startup_time .. "ms")
    end

    return issues
end
```

#### Plugin Cleanup

```lua
-- Remove unused plugins and clean cache
local function cleanup_plugins()
    -- Clean Lazy cache
    require("lazy").clean()

    -- Remove orphaned configurations
    local plugin_configs = vim.fn.glob("lua/plugins/*.lua", true, true)
    local lazy_plugins = require("lazy").plugins()

    for _, config_file in ipairs(plugin_configs) do
        local plugin_name = vim.fn.fnamemodify(config_file, ":t:r")
        if not lazy_plugins[plugin_name] then
            vim.fn.delete(config_file)
        end
    end
end
```

#### Performance Monitoring

```lua
-- Monitor and report performance metrics
local function performance_report()
    local metrics = {
        startup_time = 0,
        plugin_count = 0,
        memory_usage = 0,
        lsp_servers = 0
    }

    -- Measure startup time
    vim.cmd("profile start /tmp/nvim-startup.log")
    vim.cmd("profile func *")
    vim.cmd("profile file *")

    -- Generate report
    return metrics
end
```

### Agent Behavior Configuration

#### Automated Actions

- **Fix**: Automatically fix common configuration issues
- **Warn**: Alert about potential problems without fixing
- **Report**: Generate reports on configuration health
- **Update**: Keep dependencies and plugins current
- **Optimize**: Continuously improve performance

#### Manual Review Required

- Breaking plugin changes
- Major architectural changes
- New language server additions
- Significant performance regressions
- Security-related configurations

#### Escalation Triggers

- Startup time > 200ms
- Memory usage > 100MB
- Plugin conflicts detected
- LSP servers failing
- Configuration syntax errors

---

**Agent Status**: Active monitoring and maintenance enabled **Last Updated**:
2024-11-14 **Version**: 1.0.0
