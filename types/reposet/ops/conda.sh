source .tmp/_env.sh

su -m $USER <<'EOF'
  source activate.sh
  reposetaudittool
EOF
