source .tmp/_env.sh

cd .tmp/downloads
if [[ $MACHINE == "Mac" ]]; then
  :
else
  rm terraform*
  wget https://tl-build-resources.s3.us-east-2.amazonaws.com/terraform_0.12.24_linux_amd64.zip
fi
cd -

if [[ $MACHINE == "Mac" ]]; then
  :
else
  cd .tmp/downloads
  unzip terraform_0.12.24_linux_amd64.zip
  cp terraform ../bin/terraform
fi
