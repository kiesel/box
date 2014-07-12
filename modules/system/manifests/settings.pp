class system::settings {
	exec { 'vim-default-editor':
		command => '/usr/bin/update-alternatives --set editor /usr/bin/vim.basic',
		user 	=> root,
		cwd 	=> '/root'
	}
}