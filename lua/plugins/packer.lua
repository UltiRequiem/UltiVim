return require("packer").startup(
function()
  use {"wbthomason/packer.nvim"}
  use {"lewis6991/gitsigns.nvim"}
  use {"neoclide/coc.nvim"}
  use {'mhartington/oceanic-next'}
  use {'hoob3rt/lualine.nvim'}
  use {"kyazdani42/nvim-tree.lua"}
  use {"kyazdani42/nvim-web-devicons"}
  use {"glepnir/dashboard-nvim"}
  use {"phaazon/hop.nvim"}
  use {"nvim-lua/plenary.nvim"}
  use {"nvim-lua/popup.nvim"}
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-telescope/telescope-fzy-native.nvim"},
      {"nvim-telescope/telescope-media-files.nvim"},
   }
  }
end
)
