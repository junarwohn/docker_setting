DOCKER_USER='jd'
DOCKER_PASSWD='cass1234!'
mkdir -p /home/${USER}/workspace
#docker build -t cu11_nn8_1804 cuda_11_cudnn8_ubuntu1804 --build-arg ARG_PASSWD=${DOCKER_PASSWD} --build-arg ARG_USER_ID=${DOCKER_USER}
#docker build -t cu11-4_nn8_1804 cuda_11-4_cudnn8_ubuntu1804 --build-arg ARG_PASSWD=${DOCKER_PASSWD} --build-arg ARG_USER_ID=${DOCKER_USER}
#docker build -t cu11-4_nn8_2004 cuda_11-4_cudnn8_ubuntu2004 --build-arg ARG_PASSWD=${DOCKER_PASSWD} --build-arg ARG_USER_ID=${DOCKER_USER}
#docker build -t cu11-8_nn8_2204 cuda_11-8_cudnn8_ubuntu2204 --build-arg ARG_PASSWD=${DOCKER_PASSWD} --build-arg ARG_USER_ID=${DOCKER_USER}
docker build -t l4t_tf_291 jetson_r35_5-0-2-tf --build-arg ARG_PASSWD=${DOCKER_PASSWD} --build-arg ARG_USER_ID=${DOCKER_USER}

