class system::packages {
	$php_packages = [
		'php5-cli',
		'php5-curl',
		'php5-fpm',
		'php5-gd',
		'php5-imap',
		'php5-intl',
		'php5-ldap',
		'php5-json',
		'php5-mcrypt',
		'php5-mysql',
		'php5-pgsql',
		'php5-sqlite',
		'php5-xdebug',
		'php5-xsl'
	]

	package { $php_packages:
		ensure => installed
	}

	$packages = [
		'curl',
		'figlet',
		'git',
		'git-svn',
		'htop',
		'jq',
		'maven',
		'netcat-openbsd',
		'openjdk-7-jdk',
		'openjdk-7-jre',
		'rake',
		'realpath',
		'subversion',
		'tmux',
		'tree',
		'wget',
		'zsh',
	]

	package { $packages:
		ensure => installed
	}
}