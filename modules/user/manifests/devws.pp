class user::devws {
	file { 'setup-devws.sh':
		ensure 		=> present,
		source		=> "puppet:///modules/user/setup-devws.sh",
		path		=> '/home/kiesel/bin/setup-devws.sh',
		owner 		=> 'kiesel',
		mode 		=> 0700,
		require		=> User['kiesel']
	}

	exec { 'run-setup-devws':
		command 	=> '/bin/bash /home/kiesel/bin/setup-devws.sh',
		user 		=> 'kiesel',
		cwd			=> '/home/kiesel',
		require 	=> File['setup-devws.sh'],
		logoutput	=> true,
		environment => [
			'USER=kiesel',
			'HOME=/home/kiesel',
		]
	}
}