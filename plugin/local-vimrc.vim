if getcwd() != $HOME && getcwd() != $HOME . '/.vim' && filereadable(expand('./.vimrc'))
  source ./.vimrc
endif
