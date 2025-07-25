return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = "Telescope",
  keys = {
    { "<leader>3", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Live Grep" },
    -- TODO identify if this shoudl be git files
    { "<leader>4", "<cmd>Telescope find_files<cr>", mode = "n", desc = "Find Files" },
  },
  config = function()
    require('telescope').setup{
      defaults = {
        layout_strategy = 'vertical',
        layout_config = { height = 0.95 },
        mappings = {
          i = {
            ['<CR>'] = require('telescope.actions').select_tab,
          }
        }
      }}

    end
  }

