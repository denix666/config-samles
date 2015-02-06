node default {
    file { '/etc/profile.d/denix-bash.sh':
	source => 'puppet:///files/etc/profile.d/denix-bash.sh',
	mode => 0644,
	owner => root,
    }
    
    file { '/etc/profile.d/denix-prompt.sh':
	source => 'puppet:///files/etc/profile.d/denix-prompt.sh',
	mode => 0644,
	owner => root,
    }
    
    $packages = [ 'git','screen','bash-completion','geany','firefox','mc' ]
    package { $packages:
	ensure => installed,
    }
    
    package { 'abrt*':
	ensure => absent,
    }
    
    file { '/scripts':
	ensure => directory,
    }
}
