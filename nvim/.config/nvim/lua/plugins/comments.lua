return {
    "terrortylor/nvim-comment",
    name = "nvim_comment",
    cmd = "CommentToggle",
    keys = {
        { mode = { "v", "n" }, "<leader>cl", ":CommentToggle<cr>" }
    },
    opts = {
        comment_empty = false,
    }
}
