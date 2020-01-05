vagrant up
vagrant ssh --command 'cd /vagrant; sudo bash maintenance/install_deps.sh'
vagrant ssh --command 'cd /vagrant; sudo bash maintenance/install_salt_open.sh'
vagrant ssh --command 'cd /vagrant; sudo bash maintenance/run_salt.sh'
vagrant ssh --command 'cd /vagrant; sudo bash maintenance/test.sh'
