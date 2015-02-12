node 'ubuntu-VirtualBox' {

package { 'aptitude':
ensure => installed,
}

package{'vnc4server':
ensure => installed,
}
include jenkins
}

