wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sh bootstrap-salt.sh -P -X git v2018.3.3
rm bootstrap-salt.sh

mkdir -p /etc
mkdir -p /etc/salt
rm -rf /etc/salt/minion
cp salt/minion /etc/salt/minion
