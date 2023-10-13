FROM debian:latest

RUN apt update && apt install -y build-essential git wget libsctp-dev cmake-curses-gui libpcre2-dev python3 python3-dev swig


RUN git clone https://gitlab.eurecom.fr/mosaic5g/flexric.git /ric && \
    cd /ric && \
    git checkout e2ap-v2 && \
    wget https://docs.srsran.com/projects/project/en/latest/_downloads/d0bb1100d471824e1f5536ddd0765d0d/flexric.patch -O /ric/ric.patch && \
    git apply -v ./ric.patch && \
    mkdir build && \
    cd /ric/build && \
    cmake ../ && \
    make && \
    make install
    


COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
