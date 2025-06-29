" clipboard
if has("clipboard")
  if has("unnamedplus")
    " When possible use + register for copy-paste
    set clipboard=unnamedplus
  else
    " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" use terminal color theme
set notermguicolors
