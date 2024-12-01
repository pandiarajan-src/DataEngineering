FROM python:3.10.1-bullseye

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-setuptools \
    python3-venv \
    python3-wheel \
    && apt-get clean

#
# Following command helps to build and install the dependencies.
#
# docker build .
# docker scout quickview
# docker image ls
# docker run -it 291662c41ed4 bash
