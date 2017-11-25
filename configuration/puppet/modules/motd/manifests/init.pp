class motd {
        package {'lynx':
            ensure => installed,
        }
        file {'/etc/profile.d/motd.sh':
            ensure => file,
            mode    => '0755',
            owner   => 'root',
            group   => 'root',
            source => 'puppet:///modules/motd/motd.sh',
        }

    }
