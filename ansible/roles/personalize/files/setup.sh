#!/usr/bin/env bash

set -e -u

echo "===> Setting up development workspace ..."

if [ ! -d $HOME/.homesick/repos/homeshick ]; then
	git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi

source $HOME/.homesick/repos/homeshick/homeshick.sh

[ ! -d ~/.homesick/repos/oh-my-zsh ] && homeshick -b -f clone robbyrussell/oh-my-zsh
[ ! -d ~/.homesick/repos/dotfiles ] && {
	homeshick -b -f clone git@github.com:kiesel/dotfiles.git
}

homeshick link --force

which xpcli >/dev/null || {
	curl -Ls 'https://github.com/xp-framework/xp-runners/raw/master/setup' | php -- -d $HOME/bin
}

# Generate xp.ini
grep -q 'PLEASE EDIT' ~/bin/xp.ini || {
  IFS=$'\r\n' PTH=($(find ~/dev/xp6 -maxdepth 2 -name '*.pth' | xargs -n 1 dirname | sed -e "s#$HOME#~#g"))
  # for E in $PTH; do echo -n "$E:"; done
}

which composer >/dev/null || {
  curl -sS https://getcomposer.org/installer | php -- --install-dir=$HOME/bin/ --filename=composer
}

which dolly >/dev/null || {
  sudo pip install dolly
}

which expl >/dev/null || {
  git clone https://github.com/kiesel/wormhole $HOME/wormhole
  cd $HOME/wormhole && ./install.sh guest
}