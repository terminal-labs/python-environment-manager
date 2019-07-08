mkdir -p /home/circleci/.ssh
rm /home/circleci/.ssh/*

ssh-keygen -t rsa -N "" -f /home/circleci/.ssh/id_rsa 
echo -e "Host github.com\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null\n" > /home/circleci/.ssh/config
ssh-keyscan github.com >> /home/circleci/.ssh/known_hosts

# circleci
sudo touch /home/circleci/.ssh/authorized_keys

sudo chown -R circleci /home/circleci/.ssh
sudo chgrp -R circleci /home/circleci/.ssh
sudo chmod 755 /home/circleci
sudo chmod 700 /home/circleci/.ssh
sudo chmod 600 /home/circleci/.ssh/authorized_keys
sudo chmod 644 /home/circleci/.ssh/known_hosts
sudo chmod 644 /home/circleci/.ssh/config
sudo chmod 600 /home/circleci/.ssh/id_rsa.pub
sudo chmod 600 /home/circleci/.ssh/id_rsa

# vagrant
sudo cp -a /home/circleci/.ssh/. /home/vagrant/.ssh/
sudo chown -R vagrant /home/vagrant/.ssh
sudo chgrp -R vagrant /home/vagrant/.ssh
  
sudo touch /home/vagrant/.ssh/authorized_keys

sudo su vagrant <<'EOF'
  sudo chmod 755 /home/vagrant
  sudo chmod 700 /home/vagrant/.ssh
  sudo chmod 600 /home/vagrant/.ssh/authorized_keys
  sudo chmod 600 /home/vagrant/.ssh/known_hosts
  sudo chmod 600 /home/vagrant/.ssh/config
  sudo chmod 600 /home/vagrant/.ssh/id_rsa.pub
  sudo chmod 600 /home/vagrant/.ssh/id_rsa
  USER=vagrant
  SUDO_USER=vagrant
  unset SUDO_UID SUDO_GID SUDO_USER  
  git config --global url."https://github.com/".insteadOf git@github.com:
  git config --global url."https://".insteadOf git://  
  git clone https://github.com/saltstack/salt.git
EOF
