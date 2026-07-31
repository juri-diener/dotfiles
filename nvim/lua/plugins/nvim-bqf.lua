return {
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    dependencies = { "junegunn/fzf" }, -- REQUIRED
    opts = {
      filter = {
        fzf = true, -- ENABLES zf/fzf in help popup
      },
    },
  },
}
