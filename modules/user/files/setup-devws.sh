#!/usr/bin/env bash

set -e -u

echo "===> Setting up development workspace ..."

if [ ! -d $HOME/.homesick/repos/homeshick ]; then
	git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi

source $HOME/.homesick/repos/homeshick/homeshick.sh

[ ! -d ~/.homesick/repos/oh-my-zsh ] && homeshick -b -f clone robbyrussell/oh-my-zsh
[ ! -d ~/.homesick/repos/dotfiles ] && {
	homeshick -b -f clone kiesel/dotfiles
	sh -c "cd ~/.homesick/repos/dotfiles/ ; git remote add upstream git@github.com:kiesel/dotfiles.git"
}

if [ ! -e $HOME/bin/xp ]; then
	cd $HOME/bin
	wget 'http://xp-framework.net/downloads/releases/bin/setup' -O - | php
fi
