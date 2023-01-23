FROM python:3.10-buster as base
FROM node:slim

COPY --from=node /usr/local/include/ /usr/local/include/
COPY --from=node /usr/local/lib/ /usr/local/lib/
COPY --from=node /usr/local/bin/ /usr/local/bin/

RUN apt update \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/neovim/neovim \
    && cd neovim \
    && make CMAKE_BUILD_TYPE=RelWithDebInfo \
    && sudo make install
