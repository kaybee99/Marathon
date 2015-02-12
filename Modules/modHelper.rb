require 'net/ssh'
require 'net/scp'

def SSH(host, user, psw, keys, cmd)
    puts "host/user/psw/keys/cmd"
    puts host
    puts user
    puts keys
    puts cmd
    Net::SSH.start( host,
                user, 
                :password => psw,
                :host_key => "ssh-rsa",
                :encryption => "blowfish-cbc",
                :key_data => keys
                ) do|ssh|
    @result = ssh.exec!(cmd)
    puts @result
    end
    return @result
end

def SCP(host, user, psw, from_dir, to_dir, file)
 Net::SCP.start(host, user, :password => psw) do |scp|
   # synchronous (blocking) upload; call blocks until upload completes
   scp.download  from_dir + file, to_dir
 end
end

 def doCompare(a,b)
    if(a == b)
     assert_equals(1,1,nil)
    else
     assert_equals(1,2,nil)
    end
 end
