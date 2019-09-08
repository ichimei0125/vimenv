#! /bin/bash

cd $HOME/.vim/bundle

# THANKS
# https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;