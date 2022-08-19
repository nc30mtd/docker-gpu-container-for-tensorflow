FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

# tzdataのインストール時にConfiguring tzdataの画面で止まってしまう対策
ENV DEBIAN_FRONTEND=noninteractive
# RUN apt update && \
#     apt-get install -y tzdata

RUN apt update 
RUN apt install -y --no-install-recommends \
        automake \
        autoconf \
        bzip2 \
        ca-certificates \
        cmake \
        curl \
        ffmpeg \
        flac \
        git \
        gfortran \
        g++ \
        libtool \
        libfreetype6-dev \
        libsndfile1-dev \
        make \
        nkf \
        patch \
        python3 \
        python3-pip \
        python3-dev \
        python3-distutils \
        python3-tk \
        sox \
        subversion \
        unzip \
        vim \
        wget \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt
RUN ln -s /usr/bin/python3.8 /usr/bin/python
