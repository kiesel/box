class system::settings {
	exec { 'vim-default-editor':
		command => '/usr/bin/update-alternatives --set editor /usr/bin/vim.basic',
		user 	=> root,
		cwd 	=> '/root'
	}

  cron { 'unattended-upgrades':
    command  => '/usr/bin/aptitude update ; /usr/bin/unattended-upgrades',
    user     => 'root',
    month    => '*',
    monthday => '*',
    hour     => '11',
    minute   => '0',
  }

  cron { 'unattended-upgrades-reboot':
    command  => '/bin/sleep 500 ; /usr/bin/aptitude update ; /usr/bin/unattended-upgrades',
    user     => 'root',
    special  => 'reboot'
  }
}