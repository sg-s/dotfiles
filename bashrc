# This is your bashrc file (i.e., the config file for your bash Shell)
# This should be loaded by bash when it starts up. To get it to do so, do this:
# 
# add this to your ~/.bashrc or ~/.bash_profile:
# case $- in
#    *i*) source ~/code/config-files/bashrc # fix this path to point to where this file is
# esac
#
# Tweak the following things as needed. Warning: rearranging the order of things may break everything. 

# fuck support
if [ "dalek.bio.brandeis.edu"=$(hostname) ]; then
	echo ""
else
	eval $(thefuck --alias)
fi 

# make a better prompt, colours, etc. 
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;31m\]\w\[\e[0m\] ★ '

# set default text editor to subl
export EDITOR=subl
export VISUAL=subl
export HOMEBREW_EDITOR=subl

# ########     ###    ######## ##     ##  ######  
# ##     ##   ## ##      ##    ##     ## ##    ## 
# ##     ##  ##   ##     ##    ##     ## ##       
# ########  ##     ##    ##    #########  ######  
# ##        #########    ##    ##     ##       ## 
# ##        ##     ##    ##    ##     ## ##    ## 
# ##        ##     ##    ##    ##     ##  ######  

# git auto-completion 
if [ -f /code/config-files/git-completion.bash ]; then
  . /code/config-files/git-completion.bash
fi

# julia
# export PATH="/Applications/JuliaPro-0.6.0.1.app/Contents/Resources/julia/Contents/Resources/julia/bin:$PATH"

# go path
# this is for things like github-release
# which need go
export GOPATH='/usr/local/bin/'
export PATH=$PATH:$(go env GOPATH)/bin

# python pipenv
export PATH="~/.local/bin:$PATH"

# matlab
export PATH="/Applications/MATLAB_R2018a.app/bin:$PATH"

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# homebrew
export PATH="/usr/local/sbin:$PATH" 

# webdrivers for selenium
# export PATH="/code/webdrivers:$PATH" 

# # nVIDIA cuda
# export PATH="/usr/local/cuda/bin:$PATH"

# https://github.com/sg-s/auto-bots
export PATH="/code/auto-bots:$PATH"            

# awesome git prompt, see: https://github.com/arialdomartini/oh-my-git
source /code/oh-my-git/prompt.sh    




# ######## ######## ########  ##     ## #### ##    ##    ###    ##       
#    ##    ##       ##     ## ###   ###  ##  ###   ##   ## ##   ##       
#    ##    ##       ##     ## #### ####  ##  ####  ##  ##   ##  ##       
#    ##    ######   ########  ## ### ##  ##  ## ## ## ##     ## ##       
#    ##    ##       ##   ##   ##     ##  ##  ##  #### ######### ##       
#    ##    ##       ##    ##  ##     ##  ##  ##   ### ##     ## ##       
#    ##    ######## ##     ## ##     ## #### ##    ## ##     ## ######## 

#  ######   #######  ##    ## ######## ####  ######   
# ##    ## ##     ## ###   ## ##        ##  ##    ##  
# ##       ##     ## ####  ## ##        ##  ##        
# ##       ##     ## ## ## ## ######    ##  ##   #### 
# ##       ##     ## ##  #### ##        ##  ##    ##  
# ##    ## ##     ## ##   ### ##        ##  ##    ##  
#  ######   #######  ##    ## ##       ####  ######   

# better auto complete
bind "set completion-ignore-case on"

# improve history
export HISTCONTROL=ignoreboth:erasedups
#export HISTSIZE=10000   # remember more things in history 

# show the computer name in a cool font (using figlet)
computer-name



# color folders in ls 
alias ls='ls -G'
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# use system ssh instead of homebrew ssh
# alias ssh='/usr/bin/ssh'
# alias scp='/usr/bin/scp'

#  ######  ##     ##  #######  ########  ########  ######  ##     ## ########  ######  
# ##    ## ##     ## ##     ## ##     ##    ##    ##    ## ##     ##    ##    ##    ## 
# ##       ##     ## ##     ## ##     ##    ##    ##       ##     ##    ##    ##       
#  ######  ######### ##     ## ########     ##    ##       ##     ##    ##     ######  
#       ## ##     ## ##     ## ##   ##      ##    ##       ##     ##    ##          ## 
# ##    ## ##     ## ##     ## ##    ##     ##    ##    ## ##     ##    ##    ##    ## 
#  ######  ##     ##  #######  ##     ##    ##     ######   #######     ##     ######  

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


# misc shortcuts
alias ba='brew update && brew upgrade && brew doctor && brew cleanup'
alias arpscan='sudo arp-scan --interface=en0 --localnet'

# handy git shortcuts
alias ga='git add -A .'
alias gd='git diff --color | diff-so-fancy'


# supports history search using up and down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on