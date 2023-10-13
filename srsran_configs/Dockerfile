FROM debian:latest

RUN apt update && apt install -y build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev    \
    libconfig++-dev libsctp-dev git libtool pkg-config libyaml-cpp-dev libgtest-dev libzmq3-dev wget swig python3 python3-dev gettext-base


RUN git clone https://github.com/zeromq/czmq.git /czmq && \
    cd /czmq && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    ldconfig

RUN git clone https://github.com/srsran/srsRAN_Project.git /srsran && \
    cd /srsran && \
    mkdir build && \
    cd /srsran/build && \
    cmake .. -DENABLE_EXPORT=ON -DENABLE_ZEROMQ=ON && \ 
    make -j $(nproc) VERBOSE=1 && \
    make install

RUN git clone https://github.com/srsRAN/srsRAN_4G.git /srsran_4g && \
    cd srsran_4g && \
    mkdir build && \ 
    cd /srsran_4g/build && \ 
    cmake ../ -DENABLE_ZEROMQ=ON && \
    make -j $(nproc) && \
    make install

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
    


COPY ./gnb.yaml /gnb.yml.template
COPY ./ue.conf /

