USER=$(/usr/bin/id -run)

mkdir -p /home/"$USER"/.ssh
rm /home/"$USER"/.ssh/*

ssh-keygen -t rsa -N "" -f /home/"$USER"/.ssh/id_rsa 
echo -e "Host github.com\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null\n" > /home/"$USER"/.ssh/config
ssh-keyscan github.com >> /home/"$USER"/.ssh/known_hosts

# circleci
sudo touch /home/circleci/.ssh/authorized_keys

sudo chown -R "$USER" /home/"$USER"/.ssh
sudo chgrp -R "$USER" /home/"$USER"/.ssh
sudo chmod 700 /home/"$USER"/.ssh
sudo chmod 644 /home/"$USER"/.ssh/authorized_keys
sudo chmod 644 /home/"$USER"/.ssh/known_hosts
sudo chmod 644 /home/"$USER"/.ssh/config
sudo chmod 600 /home/"$USER"/.ssh/id_rsa
sudo chmod 644 /home/"$USER"/.ssh/id_rsa.pub

# vagrant
sudo cp -a /home/"$USER"/.ssh/. /home/vagrant/.ssh/

sudo touch /home/vagrant/.ssh/authorized_keys

sudo chown -R vagrant /home/vagrant/.ssh
sudo chgrp -R vagrant /home/vagrant/.ssh
sudo chmod 400 /home/vagrant/.ssh
sudo chmod 400 /home/vagrant/.ssh/authorized_keys
sudo chmod 400 /home/vagrant/.ssh/known_hosts
sudo chmod 400 /home/vagrant/.ssh/config
sudo chmod 400 /home/vagrant/.ssh/id_rsa
sudo chmod 400 /home/vagrant/.ssh/id_rsa.pub

# root
sudo cp -a /home/"$USER"/.ssh/. /root/.ssh/

sudo touch /root/.ssh/authorized_keys

sudo chown -R root /root/.ssh
sudo chgrp -R root /root/.ssh
sudo chmod 400 /root/.ssh
sudo chmod 400 /root/.ssh/authorized_keys
sudo chmod 400 /root/.ssh/known_hosts
sudo chmod 400 /root/.ssh/config
sudo chmod 400 /root/.ssh/id_rsa
sudo chmod 400 /root/.ssh/id_rsa.pub

git clone https://github.com/saltstack/salt
