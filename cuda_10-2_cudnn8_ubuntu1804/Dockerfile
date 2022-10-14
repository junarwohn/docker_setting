FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04

ARG ARG_USER_ID="docker"
ARG ARG_PASSWD="1234"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get update && apt-get -y install sudo
RUN apt-get install -y apt-utils 
RUN apt-get install -y vim git x11-apps
RUN apt-get install -y python3 python3-dev python3-setuptools gcc libtinfo-dev zlib1g-dev build-essential cmake libedit-dev libxml2-dev
RUN apt-get install -y llvm  
RUN apt-get install -y libgl1-mesa-glx 

RUN echo "root:"${ARG_USER_ID} | chpasswd
RUN useradd -ms /bin/bash ${ARG_USER_ID} && echo ${ARG_USER_ID}":"${ARG_PASSWD} | chpasswd && adduser ${ARG_USER_ID} sudo

RUN mkdir /home/${ARG_USER_ID}/workspace

USER ${ARG_USER_ID}

