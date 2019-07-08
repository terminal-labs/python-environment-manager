mkdir -p /home/circleci/.ssh
rm /home/circleci/.ssh/*

ssh-keygen -t rsa -N "" -f /home/circleci/.ssh/id_rsa 
echo -e "Host github.com\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null\n" > /home/circleci/.ssh/config
ssh-keyscan github.com >> /home/circleci/.ssh/known_hosts

# circleci
sudo touch /home/circleci/.ssh/authorized_keys

sudo chown -R circleci /home/circleci/.ssh
sudo chgrp -R circleci /home/circleci/.ssh
sudo chmod 700 /home/circleci/.ssh
sudo chmod 600 /home/circleci/.ssh/authorized_keys
sudo chmod 644 /home/circleci/.ssh/known_hosts
sudo chmod 644 /home/circleci/.ssh/config
sudo chmod 644 /home/circleci/.ssh/id_rsa.pub
sudo chmod 400 /home/circleci/.ssh/id_rsa

# vagrant
sudo cp -a /home/circleci/.ssh/. /home/vagrant/.ssh/

sudo touch /home/vagrant/.ssh/authorized_keys

sudo su -m vagrant <<'EOF'
  sudo chown -R vagrant /home/vagrant
  sudo chgrp -R vagrant /home/vagrant
  sudo chmod 700 /home/vagrant/.ssh
  sudo chmod 600 /home/vagrant/.ssh/authorized_keys
  sudo chmod 644 /home/vagrant/.ssh/known_hosts
  sudo chmod 644 /home/vagrant/.ssh/config
  sudo chmod 644 /home/vagrant/.ssh/id_rsa.pub
  sudo chmod 400 /home/vagrant/.ssh/id_rsa
  cd /home/vagrant/.ssh
  ls
EOF

# root
sudo cp -a /home/circleci/.ssh/. /root/.ssh/

sudo touch /root/.ssh/authorized_keys

sudo chown -R root /root/.ssh
sudo chgrp -R root /root/.ssh
sudo chmod 400 /root/.ssh
sudo chmod 400 /root/.ssh/authorized_keys
sudo chmod 400 /root/.ssh/known_hosts
sudo chmod 400 /root/.ssh/config
sudo chmod 400 /root/.ssh/id_rsa
sudo chmod 400 /root/.ssh/id_rsa.pub
