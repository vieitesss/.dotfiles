local M = {}

M.defaults = {
  [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
  ]],
  [[ command! BufferKill lua require('lvim.core.bufferline').buf_kill('bd') ]],
  -- :LvimInfo
  [[ command! LvimInfo lua require('lvim.core.info').toggle_popup(vim.bo.filetype) ]],
  [[ command! LvimCacheReset lua require('lvim.utils.hooks').reset_cache() ]],
  [[ command! LvimUpdate lua require('lvim.bootstrap').update() ]],
  [[ command! LvimSyncCorePlugins lua require('lvim.plugin-loader'):sync_core_plugins() ]],
  [[ command! LvimReload lua require('lvim.config'):reload() ]],
  [[ command! LvimToggleFormatOnSave lua require('lvim.core.autocmds').toggle_format_on_save() ]],
  [[ command! LvimVersion lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog() ]],
}

M.load = function(commands)
  for _, command in ipairs(commands) do
    vim.cmd(command)
  end
end

return M
