USER_ID=appid1

sudo adduser ${USER_ID}
sudo echo "${USER_ID}" | passwd --stdin ${USER_ID}
sudo usermod -aG wheel ${USER_ID}

sudo echo "%wheel  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

mkdir -p /home/${USER_ID}/.ssh
for x in `ls /public_keys`
do
    PUBLIC_KEY=`sudo cat /public_keys/$x`
    echo "${PUBLIC_KEY} ${USER_ID}" >> /home/${USER_ID}/.ssh/authorized_keys
done


sudo chmod -R 600 /home/${USER_ID}/.ssh
sudo chmod 700 /home/${USER_ID}/.ssh
sudo chown -R ${USER_ID} /home/${USER_ID}/.ssh
sudo chgrp -R ${USER_ID} /home/${USER_ID}/.ssh

sudo systemctl restart sshd

sudo yum -y update
sudo yum -y install java-1.8.0-openjdk-devel

java -version
