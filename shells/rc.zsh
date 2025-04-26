#!/bin/zsh
#
# This file contains zshrc resources.
#
# Copyright (c) 2023-2025 Air Quality And Related Topics (AQArt).
#
# License: BSD 3-Clause "New" or "Revised" License (BSD-3-Clause).

# Better prompt
PS1="%F{blue}%T%f %F{red}%~%f"$'\n'

if [ "$(uname -o)" = "Darwin" ]; then
    function open_vscode_with_conda_env
    {
        micromamba run -n $1 open -a 'Visual Studio Code'
    }
fi
