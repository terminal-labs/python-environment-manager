unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
MACHINE=machine
export MACHINE

USERNAME=$1
bash create.sh ${USERNAME}
su -m ${USERNAME} <<'EOF'
  source activate.sh ${USERNAME}
  pip install rambo-vagrant
  rambo up
EOF
