#!/usr/bin/env bash

set -e -u 

figlet "DevWS for $USER"

cd $HOME/dev
if [ ! -d $HOME/dev/hub ]; then
	git clone https://github.com/github/hub.git
	cd hub
	rake install prefix=$HOME/
fi

alias git=hub

cd $HOME/dev
if [ ! -d $HOME/dev/xp-framework ]; then
	git clone xp-framework/xp-framework
fi 

