#!/bin/sh

TGT_EMACS_FILE=~/.emacs.d/init.el
TGT_TMUX_FILE=~/.tmux.conf

DOTFILES=~/dotfiles

rm -f  ~/.emacs
rm -f  ~/.emacs.el
rm -f  ${TGT_EMACS_FILE}
ln -s  ${DOTFILES}/init.el     ${TGT_EMACS_FILE}
rm -f  ${TGT_TMUX_FILE}
ln -s  ${DOTFILES}/tmux.conf   ${TGT_TMUX_FILE}
