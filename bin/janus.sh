git clone https://github.com/meetecho/janus-gateway.git
git checkout tags/v0.6.1
cd janus-gateway
sh autogen.sh
./configure --prefix=/opt/janus --disable-rabbitmq --disable-mqtt
make
make install
make configs
