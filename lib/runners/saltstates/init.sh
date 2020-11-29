mkdir -o /vagrant
mkdir -p /vagrant/.tmp

cd /vagrant/.tmp

wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sh bootstrap-salt.sh -P -X git v2018.3.3
rm bootstrap-salt.sh

cd /vagrant

cp -r saltstack/etc/* /etc/salt
cp -r saltstack/srv/* /srv
