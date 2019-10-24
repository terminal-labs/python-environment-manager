# start of section that inherits sudo
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" update
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade

apt-get update -y --quiet
apt-get upgrade -y --quiet

apt update -y --quiet
apt upgrade -y --quiet

apt-get install -y -f
apt install -y -f

apt install -y --quiet ca-certificates

apt install -y build-essential

apt install -y \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libffi-dev \
    zip \
    unzip \

apt install -y wget
apt install -y nano
apt install -y emacs

apt install -y python3
apt install -y python3-pip
apt install -y python3-dev
apt install -y python3-venv
