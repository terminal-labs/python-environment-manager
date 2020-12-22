getmachine () {
  unameOut="$(uname -s)"
  case "${unameOut}" in
      Linux*)     machine=Linux;;
      Darwin*)    machine=Mac;;
      CYGWIN*)    machine=Cygwin;;
      MINGW*)     machine=MinGw;;
      *)          machine="UNKNOWN:${unameOut}"
  esac
  _MACHINE=$machine
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

emit_env_file () {
cat > .tmp/_env.sh <<EOF
export APPNAME=-appname-
export USERNAME=-username-
export PLATFORM=-platform-
export CMD=-cmd-
EOF
}

edit_env_file () {
  sed "s/$1/$2/g" .tmp/_env.sh > .tmp/_env.tmp
  rm .tmp/_env.sh
  mv .tmp/_env.tmp .tmp/_env.sh
}
