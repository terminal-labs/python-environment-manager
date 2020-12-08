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

install_project_repo_pip () {
  cd .tmp/repos
  cd ${1}
  pip install -e .
  cd ../../..
}
