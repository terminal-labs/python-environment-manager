source .tmp/_env.sh

if [[ $MACHINE == "Mac" ]]; then
  :
else
  cd .tmp/download
  rm terraform*
  wget https://tl-build-resources.s3.us-east-2.amazonaws.com/terraform_0.14.3_linux_amd64.zip
  cd ../..
fi

if [[ $MACHINE == "Mac" ]]; then
  :
else
  cd .tmp/download
  unzip terraform_0.14.3_linux_amd64.zip
  cp terraform ../bin/terraform
  cd ../..
fi
