#!/bin/bash


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


echo $SCRIPT_DIR

# get list of things running 
cd $SCRIPT_DIR && SERVERS=$(/opt/homebrew/bin/pixi run jupyter lab list) && cd -
echo $SERVERS


# Check if HOSTNAME is set
if [ -z "$HOSTNAME" ]; then
    # HOSTNAME is not set
    IP="localhost"
else
    # HOSTNAME is set
    IP="$HOSTNAME"
fi


if [[ $SERVERS == *"token"* ]]; then
  # Jupyter lab is running, do nothing
else
  # not running, start it
  echo "Jupyter NOT running, attempting to start..." >> ~/Library/logs/jupyter.log
  cd $SCRIPT_DIR && /opt/homebrew/bin/pixi run jupyter lab  --port 8888 --ip $IP --notebook-dir $HOME/code/ --no-browser && cd -
  echo "DONE"
fi
