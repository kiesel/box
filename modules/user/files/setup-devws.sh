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
if [ ! -d $HOME/dev/dotfiles ]; then
	git clone dotfiles
fi

cd $HOME/dev
if [ ! -d $HOME/dev/xp-framework ]; then
	git clone xp-framework/xp-framework
fi

if [ ! -e $HOME/bin/xp ]; then
	cd $HOME/bin
	wget 'http://xp-framework.net/downloads/releases/bin/setup' -O - | php
fi