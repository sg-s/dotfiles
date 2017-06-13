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
eval $(thefuck --alias) 

# make a better prompt, colours, etc. 
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;31m\]\w\[\e[0m\] ★ '

# # support for github-release
# export GITHUB_TOKEN=$(<.git.yale.edu-token)

# set default text editor to subl
# export EDITOR=subl
# export VISUAL=subl
# export HOMEBREW_EDITOR=subl

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

# matlab
export PATH="/Applications/MATLAB_R2017a.app/bin:$PATH"

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# homebrew
export PATH="/usr/local/sbin:$PATH" 

# webdrivers for selenium
export PATH="/code/webdrivers:$PATH" 

# # nVIDIA cuda
# export PATH="/usr/local/cuda/bin:$PATH"

# sublime text (i.e., the subl command)
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH" 

# https://github.com/sg-s/auto-bots
export PATH="/code/auto-bots:$PATH"            

# awesome git prompt, see: https://github.com/arialdomartini/oh-my-git
source /code/oh-my-git/prompt.sh    

# go
export GOPATH='/usr/local/bin/'

# aliases for wifi
source ~/.wifi/wifi

# # source /usr/local/etc/bash_completion.d/password-store


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

# stupid fortune
fortune 

# color folders in ls 
alias ls='ls -G'
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad




#  ######  ##     ##  #######  ########  ########  ######  ##     ## ########  ######  
# ##    ## ##     ## ##     ## ##     ##    ##    ##    ## ##     ##    ##    ##    ## 
# ##       ##     ## ##     ## ##     ##    ##    ##       ##     ##    ##    ##       
#  ######  ######### ##     ## ########     ##    ##       ##     ##    ##     ######  
#       ## ##     ## ##     ## ##   ##      ##    ##       ##     ##    ##          ## 
# ##    ## ##     ## ##     ## ##    ##     ##    ##    ## ##     ##    ##    ##    ## 
#  ######  ##     ##  #######  ##     ##    ##     ######   #######     ##     ######  

# # python
# alias pip3-UA='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'

# misc shortcuts
alias ba='brew update && brew upgrade && brew doctor && brew cleanup'
alias arpscan='sudo arp-scan --interface=en0 --localnet'

# handy git shortcuts
alias ga='git add -A .'
alias gc='git commit -v'
alias gp='git push && git push alt master'
alias gd='git diff --color | diff-so-fancy'


# supports history search using up and down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on

# Added by termtile (https://github.com/apaszke/termtile)
alias ur='osascript /code/termtile//tile.scpt up right'
alias dl='osascript /code/termtile//tile.scpt down left'
alias dr='osascript /code/termtile//tile.scpt down right'
alias ll='osascript /code/termtile//tile.scpt left'
alias rr='osascript /code/termtile//tile.scpt right'
alias up='osascript /code/termtile//tile.scpt up'
alias down='osascript /code/termtile//tile.scpt down'
alias big='osascript /code/termtile//resize.scpt '
alias cen='osascript /code/termtile//center.scpt '
alias max='osascript /code/termtile//maximize.scpt '
alias sn='osascript /code/termtile//changeScreen.scpt next'
alias fs='osascript /code/termtile//fullscreen.scpt '
