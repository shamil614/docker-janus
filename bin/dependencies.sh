apt-get install -y git-core libmicrohttpd-dev libjansson-dev \
	  libssl-dev libsrtp-dev libsofia-sip-ua-dev libglib2.0-dev \
	  libopus-dev libogg-dev libcurl4-openssl-dev liblua5.3-dev \
	  libconfig-dev pkg-config gengetopt libtool cmake automake \
    gtk-doc-tools make wget

git clone https://gitlab.freedesktop.org/libnice/libnice.git/
cd libnice
./autogen.sh
./configure --prefix=/usr
make && make install
