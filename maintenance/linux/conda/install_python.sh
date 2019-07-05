su -m $SUDO_USER <<'EOF'
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  bash Miniconda3-latest-Linux-x86_64.sh -b
  rm Miniconda3-latest*
  export PATH="~/miniconda3/bin:$PATH"
  conda --version
  conda update -y conda
  conda --version
  conda create -y -n pyvirtualbox python=3.6
  source activate pyvirtualbox

  pip install --upgrade setuptools
  pip install --upgrade pip
EOF
