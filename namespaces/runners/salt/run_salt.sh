cp /etc/salt/minion{,-dist}
cp /vagrant/saltstack/etc/minion /etc/salt/minion

mkdir -p /srv/salt

cp -r /vagrant/saltstack/srv/salt/* /srv/salt
salt-call --local state.highstate  --log-level=info
