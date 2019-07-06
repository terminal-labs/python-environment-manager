export APPNAME=$1
export USERNAME=$2
eval maintenance/mac/pyenv/install_deps.sh $APPNAME $USERNAME
eval bash maintenance/mac/pyenv/install_python.sh $APPNAME $USERNAME
eval bash maintenance/mac/pyenv/install_app.sh $APPNAME $USERNAME
eval bash maintenance/mac/pyenv/run_tests.sh $APPNAME $USERNAME
