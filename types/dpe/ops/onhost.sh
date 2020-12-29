source .tmp/_env.sh

su -m $USER <<'EOF'
  source activate.sh
  inflation inflate .
EOF
