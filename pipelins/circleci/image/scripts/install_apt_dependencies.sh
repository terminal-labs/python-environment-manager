echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" update
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade

apt-get update -y --quiet
apt-get upgrade -y --quiet
apt-get install -y -f

apt update -y --quiet
apt upgrade -y --quiet
apt install -y -f

apt install -y --quiet ca-certificates

apt install -y build-essential

apt install -y libssl-dev
apt install -y zlib1g-dev
apt install -y libbz2-dev
apt install -y libreadline-dev
apt install -y libsqlite3-dev
apt install -y libffi-dev
apt install -y zip
apt install -y unzip
apt install -y wget
apt install -y curl
apt install -y nano
apt install -y emacs
apt install -y python3
apt install -y python3-pip
apt install -y python3-dev
apt install -y python3-venv

apt install -y \
  git \
  rsync \
  cmake \
  make \
  libpq-dev \
  libcurl4  \
  libcurl4-openssl-dev  \
  libxml2 \
  libxml2-dev  \
  libssl1.1 \
  pkg-config \
  ca-certificates \
