FROM nvcr.io/nvidia/l4t-tensorflow:r35.1.0-tf2.9-py3

ARG ARG_USER_ID="docker"
ARG ARG_PASSWD="1234"

#RUN apt-get update && apt-get install -y --no-install-recommends \
#    vim \
#    apt-utils \
#RUN apt-get -y install sudo dialog apt-utils
#RUN apt-get upgrade -y
RUN apt-get update && apt-get -y install sudo
#RUN apt-get install -y apt-utils 
#RUN apt-get install -y vim git x11-apps
#RUN apt-get install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran
#RUN apt-get install -y python3 python3-dev python3-setuptools gcc libtinfo-dev zlib1g-dev build-essential cmake libedit-dev libxml2-dev
#RUN apt-get install -y llvm  
#RUN apt-get install -y libgl1-mesa-glx 

#RUN apt-get install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran 
#RUN apt-get install -y python3-pip
#RUN pip3 install -U pip testresources setuptools==49.6.0 
#RUN pip3 install -U numpy==1.19.4 future==0.18.2 mock==3.0.5 h5py==2.10.0 keras_preprocessing==1.1.1 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11
#RUN pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v50 tensorflow

RUN echo "root:"${ARG_USER_ID} | chpasswd
RUN useradd -ms /bin/bash ${ARG_USER_ID} && echo ${ARG_USER_ID}":"${ARG_PASSWD} | chpasswd && adduser ${ARG_USER_ID} sudo && usermod -a -G video  ${ARG_USER_ID}

RUN mkdir /home/${ARG_USER_ID}/workspace

USER ${ARG_USER_ID}