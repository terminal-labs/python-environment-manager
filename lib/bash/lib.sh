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
  cd ${1}
  pip install -e .
  cd ../../..
}
