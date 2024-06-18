#!/bin/bash

# jupyter location
JUPYTER_DIR="$HOME/code/jupyter"


# get list of things running 
cd $JUPYTER_DIR && SERVERS=$(poetry run jupyter lab list) && cd -
echo $SERVERS


if [[ $SERVERS == *"token"* ]]; then
  # Jupyter lab is running, do nothing
  echo "Jupyter running, nothing to do" >> ~/Library/logs/jupyter.log
else
  # not running, start it
  echo "Jupyter NOT running, attempting to start..." >> ~/Library/logs/jupyter.log
  cd $JUPYTER_DIR && poetry run jupyter lab  --port 8888 --ip $HOSTNAME --notebook-dir ~/code/ --no-browser 
  echo "DONE"
fi
