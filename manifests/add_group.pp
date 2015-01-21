class users::add_group {
	group {"itlinux":
                ensure => present,
        }
	 group {"admin":
                ensure => present,
        }
	 group {"conta":
                ensure => present,
        }
}
