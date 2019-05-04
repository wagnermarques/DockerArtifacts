#!/bin/bash
#https://www.tecmint.com/install-openssh-server-from-source-in-linux/

SSH_USERPASS=$(dd if=/dev/urandom bs=1 count=15 | base64)

__create_rundir() {
	mkdir -p /var/run/sshd
}

__create_user() {
    # Create a user to SSH into as.
    useradd -r -U -d /var/lib/sshd/ -c "sshd privsep" -s /bin/false sshduser
    echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin $SSH_USERNAME)
    echo ssh user password: $SSH_USERPASS
}

__create_hostkeys() {
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
}


__start_sshd(){
    /usr/sbin/sshd -D
}

# Call all functions
__create_rundir
__create_hostkeys
__create_user
__start_sshd

#mkdir /var/lib/sshd
#chmod -R 700 /var/lib/sshd/
#chown -R root:sys /var/lib/sshd/


#
# --with-md5-passwords
# --with-privsep-path
# --sysconfdir options which will install all
# the files in /usr/local/ (this is the default installation PREFIX).
# You can see all available options by running
# ./configure -h and customize your installation further.

# For instance, to enable PAM and SELinux support,
# add the --with-pam and --with-selinux options,
# respectively, you need to install all the necessary header files for them to work.

# The various OpenSSH configuration files located at:
#    ~/.ssh/* - this directory stores user specific ssh client configurations (ssh aliases) and keys.
#    /etc/ssh/ssh_config - this file contains system wide ssh client configurations.
#    /etc/ssh/sshd_config - contains sshd service configurations.

# To configure ssh aliases, see:
# How to Configure Custom SSH Connections to Simplify Remote Access

# How to Create SSH Tunneling or Port Forwarding in Linux
# How to Change Default SSH Port to Custom Port in Linux
# 4 Ways to Speed Up SSH Connections in Linux
# How to Find All Failed SSH Login Attempts in Linux
# How to Disable SSH Root Login in Linux

