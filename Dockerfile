FROM ubuntu:20.04
USER root

ENV GOOGLE_TEST_VERSION 1.12.1
ENV TZ Asia/Tokyo

RUN apt-get update && apt-get install -y tzdata
RUN apt-get -y install locales && \
  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

## c++
RUN apt-get install -y build-essential
RUN apt-get install -y libgtest-dev

## python
RUN apt-get -y install python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade numpy
RUN pip3 install --upgrade matplotlib

## Rust install
ENV RUST_HOME /usr/local/lib/rust
ENV RUSTUP_HOME ${RUST_HOME}/rustup
ENV CARGO_HOME ${RUST_HOME}/cargo
RUN mkdir /usr/local/lib/rust && \
  chmod 0755 $RUST_HOME
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ${RUST_HOME}/rustup.sh \
  && chmod +x ${RUST_HOME}/rustup.sh \
  && ${RUST_HOME}/rustup.sh -y --default-toolchain nightly --no-modify-path
ENV PATH $PATH:$CARGO_HOME/bin

WORKDIR /root