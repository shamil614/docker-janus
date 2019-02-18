#FROM ubuntu:18.04
FROM debian:stretch-slim


# Copy installation scripts in
RUN mkdir -p bin
COPY bin/*.sh ./bin/

# Prepare the system
RUN ./bin/setup.sh
# Install dependencies
RUN ./bin/dependencies.sh
# Install libsrtp 2.0.0 (To reduce risk of broken interoperability with future WebRTC versions)
RUN ./bin/libsrtp.sh
# Install usrsctp for data channel support
RUN ./bin/usrsctp.sh
# Install websocket dependencies
RUN ./bin/websockets.sh

# Clone, build and install the gateway
RUN ./bin/janus.sh
# Put configs in place
COPY conf/*.jcfg /opt/janus/etc/janus/

# Declare the ports we use
EXPOSE 7088 8088 8188

# Define the default start-up command
CMD ./bin/startup.sh