-- local ok, plenary_reload = pcall(require, "plenary.reload")
-- if not ok then
--   reloader = require
-- else
--   reloader = plenary_reload.reload_module
-- end
reloader = require("plenary.reload").reload_module

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return reloader(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end
