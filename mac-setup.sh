
# install brew
a=$(command -v brew | wc -l)
if [ $a -gt 0 ]
then 
	echo "brew installed"
else 
	echo "brew not installed, installing..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


# update brew
brew update

# browsers
brew cask install google-chrome
brew cask install firefox 


# utils
brew cask install caffeine 
brew cask install carbon-copy-cloner 
brew cask install licensed
brew install figlet

# dev
brew cask install sublime-text
brew install git
brew install wget
brew install bash-completion

# file syncing 
brew cask install dropbox
brew cask install google-backup-and-sync
brew cask install transmission

# audio and video
brew install ffmpeg
brew cask install vlc
brew install youtube-dl 

# security 
brew cask install little-snitch
brew cask install tunnelblick
brew install arp-scan

# show full path in finder top
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder


# configure subl to write git commit messages
git config --global core.editor "subl -n -w"