class system::samba {
	package { ['samba', 'samba-client']:
		ensure => installed
	}

	file { '/etc/samba/smb.conf':
		ensure 		=> present,
		owner 		=> root,
		group 		=> root,
		source 		=> "puppet:///modules/system/smb.conf",
		require 	=> Package['samba']
	}
}