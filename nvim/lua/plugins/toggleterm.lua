return {
  'akinsho/toggleterm.nvim', 
  version = "*", 
  keys = {
    { "<leader>2", "<cmd>ToggleTerm <cr>", mode = "n", desc = "Toggle Terminal" },
  },

  config = function()
    require('toggleterm').setup{
      direction = 'float',
    }
  end
}
