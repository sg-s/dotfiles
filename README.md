# dotfiles

This repo contains my dotfiles. 


## How to use this. 

```zsh
brew install stow
cd ~
git clone https://github.com/sg-s/dotfiles.git
cd dotfiles
stow git # for example
```

## How this works

`stow` links the files in dotfiles (this repo) to ... dotfiles
in your home directory. That way those files can live in a 
git-controlled repo (this), but yet be able to be modified and read by zsh.