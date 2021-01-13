FROM ubuntu:focal

MAINTAINER Chenglin.Ye <yechnlin@gmail.com>

# configure timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

RUN apt-get update && apt-get install -y \
	lsb-release \
	tree \
	curl \
	wget \
	git \
	vim \
	make \
	gcc \
	g++ \
	software-properties-common

# install python and golang
RUN add-apt-repository ppa:deadsnakes/ppa
RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt-get update && apt-get install -y \
	python3.8 \
	python3-pip \
	golang-go

# install tensorflow
RUN pip3 install --upgrade pip
RUN pip install \
	tensorflow \
	jupyterlab \
	matplotlib

RUN apt-get clean

# configure git info
RUN git config --global user.name "Chenglin Ye"
RUN git config --global user.email "yechnlin@gmail.com"
