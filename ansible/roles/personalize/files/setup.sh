#!/usr/bin/env bash

set -e -u

echo "===> Setting up development workspace ..."

if [ ! -d $HOME/.homesick/repos/homeshick ]; then
	git clone git@github.com:andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi

source $HOME/.homesick/repos/homeshick/homeshick.sh

[ ! -d ~/.homesick/repos/zgen ] && homeshick -b -f clone tarjoilija/zgen
[ ! -d ~/.homesick/repos/dotfiles ] && {
	homeshick -b -f clone git@github.com:kiesel/dotfiles.git
}

homeshick link --force

which dolly >/dev/null || {
  sudo pip install dolly
}
