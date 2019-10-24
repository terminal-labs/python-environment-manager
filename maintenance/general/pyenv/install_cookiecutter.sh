touch /home/circleci/.cookiecutter_replay
chmod 777 /home/circleci/.cookiecutter_replay
  
export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source maintenance/general/pyenv/env.sh
  chown -R vagrant /vagrant
  chmod -R 777 /vagrant
  export USER=vagrant
  export USERNAME=vagrant   
  pip install cookiecutter
  cookiecutter /vagrant --no-input
EOF
