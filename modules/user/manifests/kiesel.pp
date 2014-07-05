class user::kiesel {
	$sshkey = 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCwCwjJgUHZeB6XKsDGjlzjnkIburEtWksvXMWL1fQMpL+4f4lP+sKKQdL146DRzPeaGjZYs3qqYOcP9gbhbT9SaFRIzdKj1U1rFokQH+8v3/FZ0CXA3Z1CBHAfSACbCz4q74rfMiw6gjDEUMvZAGa1G1KTQ+peueyi27OPwNoRPjLnW/gFCoO4dk0EInhWHEpBEBpDhwtOoYNRgoc7mPFHHAUfIaD9hPrcjnYQTtmEzZPkgf3LLsnXcwTEIPZojwy/3IclS+LhBqvPmT/Sr9/6eVB+ApsASrh0uyqj8O9uf6j6By0Gwpu5d7Zr/62jTRhP8Sf5iA0XNaiQLnTkI9LZ3smhwI2HE0KiDipxL4ii+rLlIWCx6wsOBapHEGvvuFcLO3OuAl1nXNwEmce3ga7+mqXDyBrzOSz9IuL1u9BxBYzOg4AYZvvQXaiyGz2IrJ5/i/KPnEOjJH9hOVMRtz5BYp0UvoGN9mheZgxSQZIdujzChj4Hj3nwp8FH4icsmApITsOsTTzynPqz304UBF0YfaPCjk2SpR6svlFCilUlI9Hkvo/9Gvlq325s8zk6X/9/o2yOy43dhZetmpXIIXqumtDWkDnVUUjPNB7Nx9gt3ylFimzxAFmwSDfDMp/xVh9ae/BH+/w5xtSUf4vHd6DUXblWee/L21LkTyMPAhMoqw=='

	user { 'kiesel':
		ensure 		=> present,
		managehome 	=> true,
		shell 		=> '/usr/bin/zsh'
	}

	ssh_authorized_key { 'kiesel-ssh':
		name 	=> 'kiesel@box',
		ensure 	=> present,
		user 	=> 'kiesel',
		type    => 'rsa',
		key 	=> $sshkey
	}

	ssh_authorized_key { 'kiesel-root-ssh':
		name 	=> 'kiesel-root@box',
		ensure 	=> present,
		user 	=> 'root',
		type    => 'rsa',
		key 	=> $sshkey
	}

	ssh_authorized_key { 'kiesel-vagrant-ssh':
		name 	=> 'kiesel-vagrant@box',
		ensure 	=> present,
		user 	=> 'vagrant',
		type    => 'rsa',
		key 	=> $sshkey
	}

	exec { 'samba-add-kiesel':
		command 	=> "/usr/bin/smbpasswd -a kiesel -n",
		user 		=> "root",
		refreshonly	=> true,
		subscribe	=> User['kiesel'],
		require 	=> [User['kiesel'], Package['samba']]
	}

	exec { 'setup-oh-my-zsh':
		command 	=> "/usr/bin/git clone git://github.com/robbyrussell/oh-my-zsh.git /home/kiesel/.oh-my-zsh",
		cwd 		=> "/home/kiesel",
		user 		=> "kiesel",
		creates 	=> "/home/kiesel/.oh-my-zsh",
		require  	=> [Package['git']],
		logoutput	=> "true"
	}

	file { 'kiesel-zshrc':
		ensure 		=> present,
		source 		=> "puppet:///modules/user/.zshrc",
		path 		=> '/home/kiesel/.zshrc',
		mode 		=> 0644,
		owner 		=> "kiesel",
		group 		=> "kiesel"
	}
}