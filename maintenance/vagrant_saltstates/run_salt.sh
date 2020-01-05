cp /etc/salt/minion{,-dist}
cp /vagrant/salt/minion /etc/salt/minion
salt-call --local state.highstate  --log-level=info
