local status, comments = pcall(require, 'nvim_comment')
if not status then return end

comments.setup({
  marder_padding = true,
  comment_empty = false,
  create_mappings = true,
  operator_mapping = "<leader>c",
  line_mapping = "<leader>cl",
  hook = nil
})
