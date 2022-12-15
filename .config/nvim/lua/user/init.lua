local config = {
  plugins = {
    init = {
      "Mofiqul/dracula.nvim",
      "MattesGroeger/vim-bookmarks",
    },
  },
  colorscheme = "dracula",
  
  options = {
    o = {
      colorcolumn = '80,120',
    },
    opt = {
      tabstop = 4,
      softtabstop = 4,
      shiftwidth = 4,
      relativenumber = false,
      shortmess = a,
      cmdheight = 1,
      spelllang = en_us,
      spell = true,
    },
  },
}

return config
