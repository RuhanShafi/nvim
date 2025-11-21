return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,

  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Register all keymap groups
    wk.add({
      -- FILE EXPLORER GROUP
      { "<leader>e", group = "File Tree" },
      { "<leader>ee", desc = "Toggle file explorer" },
      { "<leader>ef", desc = "Toggle file explorer on current file" },
      { "<leader>ec", desc = "Collapse file explorer" },
      { "<leader>er", desc = "Refresh file explorer" },

      -- BUFFER WORKFLOW GROUP
      { "<leader>b", group = "Buffers" },
      { "<leader>bn", desc = "Next buffer" },
      { "<leader>bp", desc = "Previous buffer" },
      { "<leader>b>", desc = "Move buffer right" },
      { "<leader>b<", desc = "Move buffer left" },
      { "<leader>bx", desc = "Close current buffer" },
      { "<leader>bX", desc = "Close other buffers" },
      { "<leader>bc", desc = "Pick buffer to close" },
      { "<leader>bh", desc = "Close buffers to left" },
      { "<leader>bl", desc = "Close buffers to right" },
      { "<leader>bb", desc = "Pick buffer" },
      { "<leader>bj", desc = "Jump to buffer" },
      { "<leader>bP", desc = "Toggle pin buffer" },
      
      -- Buffer sorting subgroup
      { "<leader>bs", group = "Sort Buffers" },
      { "<leader>bse", desc = "Sort by extension" },
      { "<leader>bsd", desc = "Sort by directory" },
      { "<leader>bsr", desc = "Sort by relative directory" },
      { "<leader>bst", desc = "Sort by tabs" },
      
      -- TAB WORKFLOW GROUP (Native Neovim tabs)
      { "<leader>t", group = "Tabs" },
      { "<leader>to", desc = "Open new tab" },
      { "<leader>tx", desc = "Close current tab" },
      { "<leader>tn", desc = "Go to next tab" },
      { "<leader>tp", desc = "Go to previous tab" },
      { "<leader>tf", desc = "Open current buffer in new tab" },
      { "<leader>tt", desc = "Toggle buffer groups" },
      { "<leader>tg", desc = "Close buffer group" },

      -- WINDOW/SPLIT GROUP
      { "<leader>s", group = "Splits" },
      { "<leader>sv", desc = "Split window vertically" },
      { "<leader>sh", desc = "Split window horizontally" },
      { "<leader>se", desc = "Make splits equal size" },
      { "<leader>sx", desc = "Close current split" },

      -- WORKSPACE/SESSION GROUP (from autosession)
      { "<leader>w", group = "Workspace" },
      { "<leader>wr", desc = "Restore session for cwd" },
      { "<leader>ws", desc = "Save session for auto session root dir" },

      -- OTHER GROUPS
      { "<leader>n", group = "General" },
      { "<leader>nh", desc = "Clear search highlights" },
    })
  end,
}
