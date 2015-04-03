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
	wget 'https://github.com/xp-framework/xp-runners/releases/download/v5.2.0/setup' -O - | php
fi

# Generate xp.ini
grep -q 'PLEASE EDIT' ~/bin/xp.ini || {
  IFS=$'\r\n' PTH=($(find ~/dev/xp6 -maxdepth 2 -name '*.pth' | xargs -n 1 dirname | sed -e "s#$HOME#~#g"))
  # for E in $PTH; do echo -n "$E:"; done
}

[ -e ~/bin/composer ] || {
  curl -sS https://getcomposer.org/installer | php -- --install-dir=$HOME/bin/ --filename=composer
}