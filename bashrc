# This is your bashrc file (i.e., the config file for your bash Shell)
# This should be loaded by bash when it starts up. To get it to do so, do this:
# 
# add this to your ~/.bashrc or ~/.bash_profile:
# case $- in
#    *i*) source ~/code/config-files/bashrc # fix this path to point to where this file is
# esac
#
# Tweak the following things as needed. Warning: rearranging the order of things may break everything. 



#   _               _       _                      _        
#  | |__   __ _ ___| |__   | |___      _____  __ _| | _____ 
#  | '_ \ / _` / __| '_ \  | __\ \ /\ / / _ \/ _` | |/ / __|
#  | |_) | (_| \__ \ | | | | |_ \ V  V /  __/ (_| |   <\__ \
#  |_.__/ \__,_|___/_| |_|  \__| \_/\_/ \___|\__,_|_|\_\___/
                    


# make a better prompt, colours, etc. 
PS1='($CONDA_DEFAULT_ENV) \[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;31m\]\w\[\e[0m\] ★ '

# supposedly protects against attacks via paste
# see: https://unix.stackexchange.com/questions/309786/disable-default-copypaste-behaviour-in-bash/309798#309798
# and https://cirw.in/blog/bracketed-paste
bind 'set enable-bracketed-paste on'


# better auto complete
bind "set completion-ignore-case on"

# improve history
export HISTCONTROL=ignoreboth:erasedups
#export HISTSIZE=10000   # remember more things in history 


# color folders in ls 
alias ls='ls -G'
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad


# supports history search using up and down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on


# set default text editor to subl
export EDITOR='sublw'
export VISUAL='sublw'
export HOMEBREW_EDITOR=subl



#              _   _         
#  _ __   __ _| |_| |__  ___ 
# | '_ \ / _` | __| '_ \/ __|
# | |_) | (_| | |_| | | \__ \
# | .__/ \__,_|\__|_| |_|___/
# |_|        
# 

# git auto-completion 
if [ -f /code/dotfiles-files/git-completion.bash ]; then
  . /code/dotfiles/git-completion.bash
fi

#subl
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"


# python pipenv
export PATH="~/.local/bin:$PATH"

# matlab
export PATH="/Applications/MATLAB_R2019b.app/bin:$PATH"

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# homebrew
export PATH="/usr/local/sbin:$PATH" 

# https://github.com/sg-s/auto-bots
export PATH="/Users/srinivas/code/auto-bots:$PATH"            

# awesome git prompt, see: https://github.com/arialdomartini/oh-my-git
source ~/code/oh-my-git/prompt.sh    



# show the computer name in a cool font (using figlet)
computer-name



#      _                _             _       
#  ___| |__   ___  _ __| |_ ___ _   _| |_ ___ 
# / __| '_ \ / _ \| '__| __/ __| | | | __/ __|
# \__ \ | | | (_) | |  | || (__| |_| | |_\__ \
# |___/_| |_|\___/|_|   \__\___|\__,_|\__|___/
# 
                                            
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


# misc shortcuts
alias ba='brew update && brew upgrade && brew doctor && brew cleanup'
alias arpscan='sudo arp-scan --interface=en0 --localnet'

# handy git shortcuts
alias ga='git add -A .'
alias gd='git diff --color | diff-so-fancy'
# gc is a shortcut for git commit and is stored elsewhere
# similarly with gp for git push because it's a complex command





#    _       _ _       
#   (_)_   _| (_) __ _ 
#   | | | | | | |/ _` |
#   | | |_| | | | (_| |
#  _/ |\__,_|_|_|\__,_|
# |__/                 


export JULIA_NUM_THREADS=8

alias pluto='julia -e "using Pluto; Pluto.run()"'