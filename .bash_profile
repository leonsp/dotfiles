#!/bin/bash

# Avoid using .bashrc as redundant, not used by default on Mac
# shellcheck source=/Users/leonsp/.bashrc
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

# Add environment variables to ~/.profile
# Keep ~/.profile out of source control
# shellcheck source=/Users/leonsp/.profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Obviously, keep .awssecret out of source control
AWS_CONFIG_FILE="/Users/$(whoami)/.awssecret"
export AWS_CONFIG_FILE

export PATH="/usr/local/bin:$PATH"  # Homebrew executables
export PATH="$PATH:~/bin"           # Scripts

# Use nano for editing git commit messages
export EDITOR=nano

alias be="bundle exec"
alias dmsd='docker-machine start default && sleep 5 && eval $(docker-machine env default)'

# Load RVM into a shell session *as a function*

source /Users/leonsp/.iterm2_shell_integration.bash

# IBM DB2
if [ -f "/Users/$(whoami)/sqllib/db2profile" ]; then
    # shellcheck source=/Users/leonsp/sqllib/db2profile
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

# pgrep "gpg-agent" > /dev/null
# status=$?
# if [[ "$status" -ne 0 ]]; then
#   gpg-agent --daemon --enable-ssh-support \
#     --write-env-file "${HOME}/.gpg-agent-info"
# fi
#
# if [ -f "${HOME}/.gpg-agent-info" ]; then
#   # shellcheck source=/Users/leonsp/.gpg-agent-info
#   . "${HOME}/.gpg-agent-info"
#   export GPG_AGENT_INFO
#   export SSH_AUTH_SOCK
#   export SSH_AGENT_PID
# fi
#
# GPG_TTY=$(tty)
# export GPG_TTY

export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
# https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history/18443
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

source /usr/local/opt/autoenv/activate.sh

export GOPATH="${HOME}/Projects/go"
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/sbin:$PATH"

alias rancher-compose='docker run --rm -it \
  --env "COMPOSE_FILE=$COMPOSE_FILE" \
  --env "COMPOSE_PROJECT_NAME=$COMPOSE_PROJECT_NAME" \
  --env "RANCHER_URL=$RANCHER_URL" \
  --env "RANCHER_ACCESS_KEY=$RANCHER_ACCESS_KEY" \
  --env "RANCHER_SECRET_KEY=$RANCHER_SECRET_KEY" \
  --volume "$(pwd):/compose" \
  zambon/rancher-compose:0.9.2'

export GUMBY_CONFIG_PATH=/usr/local/gumby-config

# https://github.com/cloud66/habitus/blob/gh-pages/gnu-tar.md
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
