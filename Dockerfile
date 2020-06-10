ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    graphviz \
    imagemagick \
    make \
    && apt-get purge -y && apt-get autoremove -y && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade wheel pip sphinx pillow

ARG GID
ARG GID_NAME
ARG UID
ARG UID_NAME

RUN addgroup --gid ${GID} ${GID_NAME} \
    && adduser --uid ${UID} --ingroup ${GID_NAME} --home /home/${UID_NAME} --shell /bin/bash --disabled-password --gecos "" ${UID_NAME}

WORKDIR /home/${UID_NAME}/data
