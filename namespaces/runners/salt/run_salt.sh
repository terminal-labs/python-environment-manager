cp /etc/salt/minion{,-dist}

mkdir -p /etc/salt
cp /vagrant/saltstack/etc/* /etc/salt

mkdir -p /srv/salt
cp -r /vagrant/saltstack/srv/* /srv

salt-call --local state.highstate  --log-level=info
