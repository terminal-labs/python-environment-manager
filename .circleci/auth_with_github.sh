mkdir -p /home/circleci/.ssh
rm /home/circleci/.ssh/*

su circleci <<'EOF'
  ssh-keygen -t rsa -N "" -f /home/circleci/.ssh/id_rsa 
  echo -e "Host github.com\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null\n" > /home/circleci/.ssh/config
  ssh-keyscan github.com >> /home/circleci/.ssh/known_hosts
EOF

# circleci
chown -R circleci /home/circleci/.ssh
chgrp -R circleci /home/circleci/.ssh
touch /home/circleci/.ssh/authorized_keys

chmod 755 /home/circleci
chmod 700 /home/circleci/.ssh
chmod 644 /home/circleci/.ssh/authorized_keys
chmod 644 /home/circleci/.ssh/known_hosts
chmod 644 /home/circleci/.ssh/config
chmod 644 /home/circleci/.ssh/id_rsa.pub
chmod 600 /home/circleci/.ssh/id_rsa

# vagrant
cp -a /home/circleci/.ssh/. /home/vagrant/.ssh/

chown -R vagrant /home/vagrant/.ssh
chgrp -R vagrant /home/vagrant/.ssh
touch /home/vagrant/.ssh/authorized_keys

chmod 755 /home/vagrant
chmod 700 /home/vagrant/.ssh
chmod 644 /home/vagrant/.ssh/authorized_keys
chmod 644 /home/vagrant/.ssh/known_hosts
chmod 644 /home/vagrant/.ssh/config
chmod 644 /home/vagrant/.ssh/id_rsa.pub
chmod 600 /home/vagrant/.ssh/id_rsa

# root
cp -a /home/circleci/.ssh/. /root/.ssh/

chown -R root /root/.ssh
chgrp -R root /root/.ssh
touch /root/.ssh/authorized_keys

chmod 400 /root/.ssh
chmod 400 /root/.ssh/authorized_keys
chmod 400 /root/.ssh/known_hosts
chmod 400 /root/.ssh/config
chmod 400 /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa.pub
