ARG CODE_VERSION

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

ARG GID
ARG GID_NAME
ARG UID
ARG UID_NAME

RUN addgroup --gid ${GID} ${GID_NAME} \
    && adduser --uid ${UID} --ingroup ${GID_NAME} --home /home/${UID_NAME} --shell /bin/bash --disabled-password --gecos "" ${UID_NAME}
