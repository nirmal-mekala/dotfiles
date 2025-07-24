return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
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

