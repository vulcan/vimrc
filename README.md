# My VIM RC
Practical vim configuration for Python and Front-End Engineers.(Javascript, coffee, html, etc.)
## how to use

```
git clone https://github.com/vulcan/vimrc.git .vim
cp .vim/_vimrc ./.vimrc
```
open `vim` and execute `:PlugInstall` to install all the plugins

## plugin list

### nerdtree
ctrl-t  --> toggle tree view
ctrl-f  --> reveal current file in treeview
\t - n  --> focus tree view
more usage, visit https://github.com/preservim/nerdtree

### nerdcommenter
\t cc  --> comment in visual model
\t ci  --> uncomment in visual model
more usage, visit https://github.com/preservim/nerdcommenter

### ctrl-p
ctrl-p  --> fuzzy find file
\t-b  --> find in buffer

### bufexplorer
see oppend files in the first row the editor window

### emmet-vim
ctrl-e  --> expand abbrivation
e.g. html:5  <c-e>  -- > get a fully html file header
More visit https://github.com/mattn/emmet-vim

### supertab
just press <tab> to complete everything

### vim-snipmate
