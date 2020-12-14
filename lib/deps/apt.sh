DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" update
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade

apt -y install \
  git \
  wget \
  zip \
  unzip \
  rsync \
  bash-completion \
  build-essential \
  cmake \
  make \
  libpq-dev \
  libcurl4  \
  libcurl4-openssl-dev  \
  libssl-dev  \
  libxml2 \
  libxml2-dev  \
  libssl1.1 \
  pkg-config \
  ca-certificates \
  xclip \

if [[ -d "dependencies" ]];
then
  xargs apt install -y < dependencies/apt.txt
else
  :
fi
