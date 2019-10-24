mkdir -p /home/circleci/.cookiecutter_replay
chmod -R 777 /home/circleci/.cookiecutter_replay
export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source maintenance/general/pyenv/env.sh
  pip install cookiecutter
  cookiecutter /vagrant --no-input
EOF
