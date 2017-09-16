#!/bin/sh

TGT_EMACS_FILE=~/.emacs.d/init.el
TGT_EMACS_INIT_MODELINE_FILE=~/.emacs.d/init-modeline.el
TGT_TMUX_FILE=~/.tmux.conf

TGT_TMUXINATOR1=~/.tmuxinator/research.yml
TGT_TMUXINATOR2=~/.tmuxinator/skt.yml

TGT_XMODMAP=~/.Xmodmap

DOTFILES=~/dotfiles


# apt-get install exuberant-ctags

# ~/.emacs and ~/.emacs.el take precedence over ~/.emacs.d/init.el
rm -f  ~/.emacs
rm -f  ~/.emacs.el
ln -fs  ${DOTFILES}/init.el     ${TGT_EMACS_FILE}
ln -fs ${DOTFILES}/init-modeline.el ${TGT_EMACS_INIT_MODELINE_FILE}

ln -fs  ${DOTFILES}/tmux.conf   ${TGT_TMUX_FILE}

# mux start res
ln -fs  ${DOTFILES}/skt.yml          ${TGT_TMUXINATOR2}
ln -fs  ${DOTFILES}/research.yml     ${TGT_TMUXINATOR1}

# MAYBE: I need to add xmodmap ~/.Xmodmap in .bashrc?
ln -fs  ${DOTFILES}/Xmodmap     ${TGT_XMODMAP}
