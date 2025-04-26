#!/bin/sh
#
# Copyright (c) 2023-2025 Air Quality And Related Topics (AQArt).
#
# License: BSD 3-Clause "New" or "Revised" License (BSD-3-Clause).

# We set "strict" default permissions (this should be standard, shouldn'it?)
umask 077

# Basic aliases
alias e="emacs"
alias re="%emacs"
alias v="vim"
alias gst="git status"
alias gbr="git branch"
alias gco="git checkout"
alias grm="git remote"
alias eee="micromamba activate everything"

if [ "$(uname -o)" = "Darwin" ]; then
    alias man="LANG='en_US.UTF-8' man"
    alias l="ls -lhG"
elif [ "$(uname -o)" = "GNU/Linux" ]; then
    alias l="ls -lh --group-directories-first --color=auto"
fi

# Homebrew configuration
HOMEBREW_NO_ENV_HINTS=1
