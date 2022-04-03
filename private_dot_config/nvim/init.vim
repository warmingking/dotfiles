let mapleader = " "
let maplocalleader = " "

if !exists("*ReloadConfigs")
  function ReloadConfigs()
    :source ~/.config/nvim/init.vim
  endfunction
  command! RC call ReloadConfigs()
endif

lua require('plugins')
