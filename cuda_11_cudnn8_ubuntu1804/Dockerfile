FROM nvidia/cuda:11.0.3-cudnn8-devel-ubuntu18.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get update && apt-get -y install sudo
RUN apt-get install -y apt-utils 
RUN apt-get install -y vim git x11-apps
RUN apt-get install -y python3 python3-dev python3-setuptools gcc libtinfo-dev zlib1g-dev build-essential cmake libedit-dev libxml2-dev
RUN apt-get install -y llvm  
RUN apt-get install -y libgl1-mesa-glx 

RUN echo "root:cass1234!" | chpasswd
RUN useradd -ms /bin/bash jd && echo "jd:cass1234!" | chpasswd && adduser jd sudo

RUN mkdir /home/jd/workspace

USER jd

