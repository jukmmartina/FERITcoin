FROM Ubuntu:16.04

COPY . /feritcoin
WORKDIR /feritcoin

RUN sudo apt update
RUN sudo apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3
RUN sudo apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository ppa:bitcoin/bitcoin
RUN sudo apt-get update
RUN sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN sudo apt-get install -y libminiupnpc-dev
RUN sudo apt-get install -y libzmq3-dev

RUN ./autogen.sh
RUN ./configure --without-gui
RUN make
RUN make install

EXPOSE 9191 19191

CMD {"feritcoind", "-printtoconsole"}

