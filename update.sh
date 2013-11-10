#!/bin/bash
# update from github

echo "update submodules"

git pull

echo "update submodules"
git submodule init
git submodule update

git submodule foreach git pull origin master
