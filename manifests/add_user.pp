define users::add_user ( 
	$uid  	= '',
	$user 	= '',
	$realname = '',
	$shell = '',
	$groups = [],
	$sshkey = '',
        $sshkeytype = '',
){

include 'users::add_group'

    user { $user:
            uid    => $uid,
            managehome  => true,
	    comment  => $realname,
	    shell    => $shell,
	    groups => $groups,
    }

    file { "/home/$user/":
        ensure  => directory,
        owner   => $user,
        mode    => 700,
        require => User[$user]
    }

    file { "/home/$user/.ssh":
            ensure  => directory,
            owner   => $user,
            mode    => 700,
            require => File["/home/$user/"]
    }

     ssh_authorized_key {$user:
      		ensure  => present,
      		name    => $user,
      		user    => $user,
		type    => $sshkeytype,
      		key     => $sshkey,
    }

}
