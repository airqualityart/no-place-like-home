#!/bin/sh
#
# This file contains "rc" settings that are common to all shells.
#
# It can be sourced by ~/.bashrc, ~/.zshrc, etc.
#
# Copyright (c) 2023-now Air Quality And Related Topics.
#
# This code is released under the terms of the BSD 3-clause license:
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#   (1) Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
#
#   (2) Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
#   (3) The name of the author may not be used to endorse or promote products
#   derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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

if [ "$(uname -o)" = "Darwin" ]; then
    alias man="LANG='en_US.UTF-8' man"
    alias l="ls -lhG"
elif [ "$(uname -o)" = "GNU/Linux" ]; then
    alias l="ls -lh --group-directories-first --color=auto"
fi

# Homebrew configuration
HOMEBREW_NO_ENV_HINTS=1
