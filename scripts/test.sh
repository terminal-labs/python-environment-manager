cd samples

cd dpe
sudo make vagrant.onguest
vagrant destroy -f
cd ..

cd dpe-guiapp
sudo make vagrant.onguest
vagrant destroy -f
cd ..

cd dpe-webapp
sudo make vagrant.onguest
vagrant destroy -f
cd ..

cd python
sudo make conda
sudo make vagrant.conda
vagrant destroy -f
cd ..

cd python-guiapp
sudo make conda
sudo make vagrant.conda
vagrant destroy -f
cd ..

cd python-webapp
sudo make conda
sudo make vagrant.conda
vagrant destroy -f
cd ..

cd saltstates
sudo make vagrant.saltstates
vagrant destroy -f
cd ..
