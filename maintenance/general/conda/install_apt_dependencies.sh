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
