export APPNAME=$1
export USERNAME=$2
bash maintenance/mac/conda/install_deps.sh $APPNAME $USERNAME
bash maintenance/mac/conda/install_python.sh $APPNAME $USERNAME
bash maintenance/mac/conda/install_app.sh $APPNAME $USERNAME
bash maintenance/mac/conda/run_tests.sh $APPNAME $USERNAME
