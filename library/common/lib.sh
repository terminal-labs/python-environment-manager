emit_env_file () {
cat > .tmp/_env.sh <<EOF
export USER=-user-
export USERNAME=-username-
export USERHOME=-userhome-
export INTERNALUSER=-internaluser-
export INTERNALUSERNAME=-internalusername-
export INTERNALUSERHOME=-internaluserhome-
export APPNAME=-appname-
export PYTHONVERSION=-pythonversion-
export PLATFORM=-platform-
export CMD=-cmd-
export DPENAME=-dpename-
export MACHINE=-machine-
export WD=-wd-
EOF
}

getmachine () {
  unameOut="$(uname -s)"
  case "${unameOut}" in
      Linux*)     machine=Linux;;
      Darwin*)    machine=Mac;;
      CYGWIN*)    machine=Cygwin;;
      MINGW*)     machine=MinGw;;
      *)          machine="UNKNOWN:${unameOut}"
  esac
  MACHINE=$machine
}

getuserhome () {
  if [[ $MACHINE == "Mac" ]]; then
    USERHOME=/Users/$USERNAME
  else
    USERHOME=/home/$USERNAME
  fi
}

clone_repo () {
  mkdir -p .tmp/repos
  cd .tmp/repos
  git clone ${1}
  cd ../..
}

install_project_repo_pip () {
  mkdir -p .tmp/repos
  cd .tmp/repos

  path=${1}
  fullname="${path##*/}"
  dirname="${path%/*}"
  basename="${fullname%.*}"
  extension="${fullname##*.}"

  cd ${basename}
  pip install -e .
  cd ../../..
}

edit_env_file () {
  sed "s#$1#\"$2\"#g" .tmp/_env.sh > .tmp/_env.tmp
  rm .tmp/_env.sh
  mv .tmp/_env.tmp .tmp/_env.sh
}
