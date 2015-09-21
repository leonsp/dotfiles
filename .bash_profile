#!/bin/bash

# Avoid using .bashrc as redundant, not used by default on Mac
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

# Add environment variables to ~/.profile
# Keep ~/.profile out of source control
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Obviously, keep .awssecret out of source control
AWS_CONFIG_FILE="/Users/$(whoami)/.awssecret"
export AWS_CONFIG_FILE

export PATH="/usr/local/bin:$PATH"  # Homebrew executables
export PATH="$PATH:~/bin"           # Scripts
export PATH="$PATH:$HOME/.rvm/bin"  # Add RVM to PATH for scripting

# Use nano for editing git commit messages
export EDITOR=nano

alias be="bundle exec"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source /Users/leonsp/.iterm2_shell_integration.bash

eval "$(thefuck --alias)"

# DB2
if [ -f "/Users/$(whoami)/sqllib/db2profile" ]; then
    . "/Users/$(whoami)/sqllib/db2profile"
fi
# Exporting on a separate line due to shellcheck requirement
IBM_DB_INCLUDE="/Users/$(whoami)/sqllib/include"
IBM_DB_LIB="/Users/$(whoami)/sqllib/lib64"
IBM_DB_HOME="/Users/$(whoami)/sqllib"
DYLD_LIBRARY_PATH="/$(whoami)/leonsp/sqllib/lib"
export IBM_DB_INCLUDE
export IBM_DB_LIB
export IBM_DB_HOME
export DYLD_LIBRARY_PATH
export ARCHFLAGS="-arch x86_64"
