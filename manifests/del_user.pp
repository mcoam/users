class users::del_user {

   exec { "del-user":
	command => 'userdel vvargas',
	onlyif => 'grep vvargas /etc/passwd', 
    }
   exec {'remove-home':
	require => Exec['del-user'],
        command => 'rm -rf /home/vvargas',
        onlyif => 'ls /home/ |grep vvargas',
    }
}

