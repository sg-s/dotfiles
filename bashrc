# add this to your ~/.bashrc or ~/.bash_profile:
# case $- in
#    *i*) source ~/code/config-files/.bashrc
# esac

 # export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\] ★ '

########     ###    ######## ##     ##  ######  
##     ##   ## ##      ##    ##     ## ##    ## 
##     ##  ##   ##     ##    ##     ## ##       
########  ##     ##    ##    #########  ######  
##        #########    ##    ##     ##       ## 
##        ##     ##    ##    ##     ## ##    ## 
##        ##     ##    ##    ##     ##  ######  


export PATH="/Applications/MATLAB_R2014b.app/bin/maci64:$PATH"
export GOPATH='/usr/local/go/bin'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/sbin:/code/auto-bots:/code/uflix:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:/usr/local/go/bin/bin

source /usr/local/etc/bash_completion.d/password-store
source /usr/local/etc/bash_completion.d/password-store
source /code/oh-my-git/prompt.sh


 ######   #######   ######  ##     ## ######## ######## ####  ######   ######  
##    ## ##     ## ##    ## ###   ### ##          ##     ##  ##    ## ##    ## 
##       ##     ## ##       #### #### ##          ##     ##  ##       ##       
##       ##     ##  ######  ## ### ## ######      ##     ##  ##        ######  
##       ##     ##       ## ##     ## ##          ##     ##  ##             ## 
##    ## ##     ## ##    ## ##     ## ##          ##     ##  ##    ## ##    ## 
 ######   #######   ######  ##     ## ########    ##    ####  ######   ######  


# show the computer name in a cool font
computer-name

# stupid fortune
fortune 


 ######  ##     ##  #######  ########  ########  ######  ##     ## ########  ######  
##    ## ##     ## ##     ## ##     ##    ##    ##    ## ##     ##    ##    ##    ## 
##       ##     ## ##     ## ##     ##    ##    ##       ##     ##    ##    ##       
 ######  ######### ##     ## ########     ##    ##       ##     ##    ##     ######  
      ## ##     ## ##     ## ##   ##      ##    ##       ##     ##    ##          ## 
##    ## ##     ## ##     ## ##    ##     ##    ##    ## ##     ##    ##    ##    ## 
 ######  ##     ##  #######  ##     ##    ##     ######   #######     ##     ######  


# odin shortcut
alias odin='ssh odin.srinivas.gs'

# supports history search using up and down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on



##    ##  #######  ########  ######## 
###   ## ##     ## ##     ## ##       
####  ## ##     ## ##     ## ##       
## ## ## ##     ## ##     ## ######   
##  #### ##     ## ##     ## ##       
##   ### ##     ## ##     ## ##       
##    ##  #######  ########  ######## 


# node
export NVM_HOME="$HOME/code/nvm"
source "$NVM_HOME/nvm.sh"
source "$NVM_HOME/bash_completion"
. <(npm completion)

# Checks that the child directory is a subdirectory of the parent
is_subdirectory() {
    local child="$1"
    local parent="$2"
    if [[ "${child##${parent}}" != "$child" ]]; then
        return 0
    else
        return 1
    fi
}

# Activates a new environment
activate_env() {
    # Check if the directory we've cd'ed into is a node environment directory
    # (i.e., it contains a node_modules folder) and that a node envrionment
    # does not already exist before creating a new one.
    if [ -d "node_modules" ] && [ -z "$_ENV_DIR" ]; then

        # Save the old PATH variable so we can revert back to it when we leave
        # the environment
        export _OLD_PATH="$PATH"

        # An environment is essentially nothing more than an environment
        # variable (_ENV_DIR) pointing the parent directory of our node
        # environment. Create the variable and point it to $PWD.
        export _ENV_DIR="$PWD"

        # Add the bin folder for all local NPM installs to the PATH
        export PATH="$(npm bin):$PATH"

        # If an activation script exists, execute it
        if [ -e ".activate" ]; then
            source .activate
        fi
    fi
}

# Deactivates the current envrionment
deactivate_env() {
    # Make sure that an envrionment does exist and that the new
    # directory is not a subdirectory of the envrionment directory
    if [ -n "$_ENV_DIR" ] && ! is_subdirectory "$PWD" "$_ENV_DIR"; then

        # Run the deactivation script if it exists
        if [[ -e "$_ENV_DIR/.deactivate" ]]; then
            source "$_ENV_DIR/.deactivate"
        fi

        # Revert back to the original PATH
        export PATH="$_OLD_PATH"

        # Destroy the environment
        unset _ENV_DIR
        unset _OLD_PATH
    fi
}

env_cd() {
    builtin cd "$@" && deactivate_env && activate_env
}

alias cd="env_cd"