# sudo apt install libwxgtk3.0-gtk3-dev

docker build -t far2l:1.0 - <<EOL
FROM ubuntu:latest
RUN apt update

ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y build-essential gawk m4 libglib2.0-dev libwxgtk3.0-gtk3-dev libssh-dev libsmbclient-dev libnfs-dev libneon27-dev cmake g++ git
RUN git clone https://github.com/thinkingerrol/far2l.git
RUN mkdir -p /far2l/build/install
RUN cd far2l/build ; cmake -DUSEWX=yes -DCMAKE_BUILD_TYPE=Release .. ; make -j12
EOL
docker cp $(docker ps | grep far2l | cut -d ' ' -f 1):/far2l/build/install ./far
