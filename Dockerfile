ARG CODE_VERSION=slim

FROM python:${CODE_VERSION}

WORKDIR /docs

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    graphviz \
    imagemagick \
    make \
    && apt-get purge -y && apt-get autoremove -y && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install -U pip sphinx pillow
