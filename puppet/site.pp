node 'ubuntu-VirtualBox' {
 exec { 'Run my command': 
   command => '/bin/echo cunt `/bin/date ` >/tmp/command.output.txt',
 }

 package { 'vnc4server':
     ensure => installed,
 }
 service { 'vnc4server':
     ensure => running,
 }
}

