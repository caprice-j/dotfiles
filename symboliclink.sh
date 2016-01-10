#!/bin/sh

TGT_EMACS_FILE=~/.emacs.d/init.el
TGT_TMUX_FILE=~/.tmux.conf

DOTFILES=~/dotfiles


# apt-get install exuberant-ctags

# ~/.emacs and ~/.emacs.el take precedence over ~/.emacs.d/init.el
rm -f  ~/.emacs
rm -f  ~/.emacs.el
ln -fs  ${DOTFILES}/init.el     ${TGT_EMACS_FILE}


ln -fs  ${DOTFILES}/tmux.conf   ${TGT_TMUX_FILE}
