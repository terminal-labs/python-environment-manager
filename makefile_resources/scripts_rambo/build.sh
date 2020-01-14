export APPNAME=$1
export USERNAME=$2

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

bash create.sh ${APPNAME} ${USERNAME}
su -m ${USERNAME} <<'EOF'
  source .tmp/python-environment-manager-master/makefile_resources/scripts_rambo/activate.sh ${APPNAME} ${USERNAME}
  rambo up
EOF
