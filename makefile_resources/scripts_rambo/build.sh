USERNAME=$1
bash create.sh ${USERNAME}
su -m ${USERNAME} <<'EOF'
  source activate.sh ${USERNAME}
  pip install rambo-vagrant
  rambo up
EOF
