FROM ubuntu:focal
MAINTAINER Chenglin.Ye <yechnlin@gmail.com>

# configure timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	echo 'Asia/Shanghai' >/etc/timezone

# install sudo
RUN apt-get update && apt-get install sudo

# create a user
RUN useradd -ms /bin/bash ye && \
    usermod -aG sudo ye && \
    echo "ye ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ye
WORKDIR /home/ye

# install dev packages
RUN sudo apt-get update && sudo apt-get install -y \
	lsb-release \
	tree \
	curl \
	wget \
	git \
	vim \
	make \
	cmake \
	dpkg-dev \
	dh-cmake \
	gcc \
	g++ \
	ctags \
	ack \
	software-properties-common

# install python and golang
RUN sudo add-apt-repository ppa:deadsnakes/ppa && \
	sudo add-apt-repository ppa:longsleep/golang-backports && \
	sudo apt-get update && \
	sudo apt-get install -y \
		python3.8 \
		python3-pip \
		golang-go

# install pip
RUN sudo pip3 install --upgrade pip

# clean cache
RUN sudo apt-get clean
