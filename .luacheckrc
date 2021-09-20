-- Don't report unused self arguments of methods.
self = false

-- Global objects defined by the C code
globals = {"vim"}

ignore={"542"}

allow_defined = true

cache = true

exclude_files = {"./plugin/packer_compiled.lua", "./plugin/utils.lua"}

-- vim: ft=lua tw=80
