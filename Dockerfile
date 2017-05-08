FROM ubuntu:trusty

RUN apt-get update && apt-get -y install \
 git automake autoconf libtool make gcc pkg-config \
 libmysqlclient-dev mysql-client-5.6
RUN git clone https://github.com/akopytov/sysbench.git
WORKDIR /sysbench
RUN ./autogen.sh 
RUN ./configure
RUN make -j8
