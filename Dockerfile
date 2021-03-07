FROM mybase

COPY ./yucoin.conf /root/.yucoin/yucoin.conf

COPY . /yucoin
WORKDIR /yucoin

#build yucoin source
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

#open service port
EXPOSE 9666 19666

CMD ["yucoind", "--printtoconsole"]
