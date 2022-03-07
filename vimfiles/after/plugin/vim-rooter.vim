if v:version > '702' && !exists('g:vscode')
  autocmd rooter BufEnter * :Rooter
endif
