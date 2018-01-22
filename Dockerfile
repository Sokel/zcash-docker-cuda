FROM nvidia/cudagl:9.0-base-ubuntu16.04

RUN apt-get update -q && apt-get -qy install \
     wget nano build-essential pkg-config libc6-dev \
     m4 g++-multilib autoconf libtool ncurses-dev \
     unzip git python zlib1g-dev bsdmainutils automake

WORKDIR /

RUN wget https://github.com/nanopool/ewbf-miner/releases/download/v0.3.4b/Zec.miner.0.3.4b.Linux.Bin.tar.gz

RUN tar xf Zec.miner.0.3.4b.Linux.Bin.tar.gz -C .

COPY dist/entrypoint.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
