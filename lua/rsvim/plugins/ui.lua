return {
  { -- Primary Theme
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "bold" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
    },
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha" -- Need to not make Static
    end
  },
  { -- UI Overhaul
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    opts = {

    }
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        mode = "background",
        tailwind = true,
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      },
    },
  },
  {
  "folke/snacks.nvim",
  priority = 999,
  lazy = false,
  ---@type snacks.Config
  opts = {
    image = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true},  
    },
  },
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        themable = true,
      
        -- Visual style
        separator_style = "thin",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,

        -- Close icons and mouse actions
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,

        -- Diagnostics integration
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        -- Integration with Neo-tree
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
         
        -- Tab page support (for native tabs workflow)
        show_buffer_default_icon = true,
        color_icons = true,
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      
      local keymap = vim.keymap
      
      -- ========================================
      -- BUFFER WORKFLOW KEYMAPS (<leader>b)
      -- ========================================
      
      -- Navigate buffers
      keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", 
        { desc = "Next buffer" })
      keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", 
        { desc = "Previous buffer" })
    

      -- Move buffers (reorder in bufferline)
      keymap.set("n", "<leader>b>", "<cmd>BufferLineMoveNext<CR>", 
        { desc = "Move buffer right" })
      keymap.set("n", "<leader>b<", "<cmd>BufferLineMovePrev<CR>", 
        { desc = "Move buffer left" })
    
      -- Close buffers
      keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", 
        { desc = "Close current buffer"})
      keymap.set("n", "<leader>bX", "<cmd>BufferLineCloseOthers<CR>", 
        { desc = "Close other buffers" })
      keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", 
        { desc = "Pick buffer to close" })
      keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", 
        { desc = "Close buffers to left" })
      keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", 
        { desc = "Close buffers to right" })

            -- Pick/Jump to buffer
      keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<CR>", 
        { desc = "Pick buffer" })
      keymap.set("n", "<leader>bj", "<cmd>BufferLinePick<CR>", 
        { desc = "Jump to buffer" })
      
      -- Pin/unpin buffer
      keymap.set("n", "<leader>bP", "<cmd>BufferLineTogglePin<CR>", 
        { desc = "Toggle pin buffer" })
      
      -- Sort buffers
      keymap.set("n", "<leader>bse", "<cmd>BufferLineSortByExtension<CR>", 
        { desc = "Sort by extension" })
      keymap.set("n", "<leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", 
        { desc = "Sort by directory" })
      keymap.set("n", "<leader>bsr", "<cmd>BufferLineSortByRelativeDirectory<CR>", 
        { desc = "Sort by relative directory" })
      keymap.set("n", "<leader>bst", "<cmd>BufferLineSortByTabs<CR>", 
        { desc = "Sort by tabs" })

      -- Additional tab-specific bufferline commands
      keymap.set("n", "<leader>tt", "<cmd>BufferLineGroupToggle<CR>",
        { desc = "Toggle buffer groups" })
      keymap.set("n", "<leader>tg", "<cmd>BufferLineGroupClose<CR>",
        { desc = "Close buffer group" })
    end,
  }
}

