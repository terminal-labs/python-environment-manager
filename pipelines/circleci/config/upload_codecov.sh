su -m vagrant <<'EOF'
  source maintenance/vagrant/pyenv/env.sh
  cd pyvirtualbox
  cd pyvirtualbox
  pytest --cov-report=xml --cov=. tests
  pip install codecov
  codecov
EOF
