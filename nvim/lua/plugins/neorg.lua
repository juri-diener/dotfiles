return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/MyDocuments/notes/",
            },
            index = "index.norg",
            default_workspace = "notes",
          },
        },
        ["core.export"] = {},
        ["core.summary"] = {},
        ["core.keybinds"] = {
          config = {
            neorg_leader = " ",
          },
        },
      },
    })
  end,
}
