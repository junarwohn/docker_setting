# docker_settings

This repository for docker settings.

To test application in various setting and free from all OS dependency, `docker` can be quite a good option. 

We don't need `Nvidia-Docker` anymore, `docker` support GPU acceration natively.

## TL;DR

0. Install [docker](https://docs.docker.com/engine/install/ubuntu/)

1. run 
    ```
    sudo groupadd docker

    sudo usermod -aG docker ${USER}

    sudo service docker restart
    ```
    
    I bet you want to use gpu.
    
    Make sure you have installed nvidia-driver.
    
    Check

    ```
    nvidia-smi
    ```
    
    Then run
    
    ```
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
        && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
        && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

    sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
    sudo systemctl restart docker
    ```

3. Uncomment desirable command in `docker_build.sh` and change some username and password to use in docker.

4. Uncomment desirable command in `docker_run.sh` and change some username and password to use in docker.

5. Run
    ```
    bash docker_build.sh

    bash docker_run.sh
    ```
6. Some basic commands.

    **Host (Outside Docker)**

    - `docker -ps -al` for List all docker containers.

    - `docker images` for List all docker Images

    - `docker start your_container_name` for Starting running container.

    - `docker attach your_container_name` for Attaching running container.

    - `docker stop your_container_name` for Stopping running container.

    **Container (Inside Docker)**

    - Just type `exit` inside docker for Stopping the docker container. 

    - `Ctrl+p and Ctrl+q` for Detaching the docker container.
    

7. If you want to display GUI of docker

    ```
    xhost +local:docker
    ```
    
## Before you run these scripts...

- Honestly, **I'm not a docker expert.**

- My method can be ***a way different from common usages***. Do at your own risk.

- We cannot directly access the data inside *docker* except for *sharing directory (`$USER/workspace` as default share directory in my script)*.

- **Your data can be lost when removing docker container.**

- **Your container can be shut down when you just run `exit` command in bash inside docker.**

    - You have to use *detach docker* instead.

    - In linux, command is `Ctrl+p and Ctrl+q`. You have to addtionally setting when using VSCode because some other keymap already set. 
        - https://stackoverflow.com/questions/55484562/how-to-detach-from-docker-container-from-integrated-terminal-send-ctrl-p-ctr

    - You can turn off docker by just typing 
        ```
        exit
        ```

        and start and attach bash by

        ```
        docker start your_container_name

        docker attach your_container_name
        ```


## Concepts

I divide whole process into 2 phases(actually 3).


## Phase 0 : Some prerequisites
 

### 0-1. Use docker without `sudo` previlege.

Usally, docker should run with `sudo` privilege.

Well, I have some allergic to using `sudo` and nervous when application runs with `sudo`.

So, let's add `docker` to group and run docker application without _sudo_ privilege.


```
// https://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo

sudo groupadd docker

sudo usermod -aG docker ${USER}

sudo service docker restart
```

### 0-2. Use GPU

#### 0-2-1. Nvidia GPU

Also, for those who want use **Nvidia GPU inside docker**, please make sure you have installed suitable graphic driver.

You can check by

```
// I know you are not a dumb, but just in case.

nvidia-smi
```

Then you have to install `nvidia-container-toolkit`.

```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

```

#### 0-2-1. Jetson GPU

Well, you should first Nvidia [JetPack](https://developer.nvidia.com/embedded/jetpack).

Then check your version of **JetPack**. 

Normally, you can check version by

```
// https://code.luasoftware.com/tutorials/jetson-nano/check-current-jetson-jetpack-version/
apt-cache show nvidia-jetpack

// Package: nvidia-jetpack
// Version: 4.3-b134
// ...
```

For Nvidia's board like Jetson-Xavier, they made fancy name [`NGC`](https://catalog.ngc.nvidia.com/containers).


For deeplearning, **it is good for your mental health to use pre-installed Deeplearning framework images** like [NVIDIA L4T Tensorflow](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-tensorflow)


**You must install the image that matchs your JetPack version.**

For JetPack 5.0.2, available docker images are below.

```
// https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-tensorflow

JetPack 5.0.2 (L4T R35.1.0)

    l4t-tensorflow:r35.1.0-tf1.15-py3
        TensorFlow 1.15.5
    
    l4t-tensorflow:r35.1.0-tf2.9-py3
        TensorFlow 2.9.1
```

## Phase 1 : Build Image 
    
Build image is like *downloading OS's ISO file*.

Find well-made docker images.

For example, you can build image by 

```
bash docker_build.sh
```

**Actual download process** run during build, so the only thing you care about is **check the docker image url** 

For example,
   
```
// DockerFile
FROM nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04
// You can find other versions from https://hub.docker.com/r/nvidia/cuda/tags
...
```

## Phase 2 : Make Container

Make container is like creating some 

You can make container by

```
bash docker_run.sh
```

In this phase, you can set 

- Which **gpu** to use.

- Which **directories to share** with host os.

- Which **port** to share with host os. (Like Port-Fowarding)

- Which **image** to use.

- **Share display** with host os.

- Set **container name**


## Things you might be interested but, I bet you are too busy to read...

Some explainations about options I use.

Take a deep breath and find out what these evil things are.

## FAQ - RTFM

```docker: Error response from daemon: Conflict. The container name "~~~~~" is already in use by container "--------". You have to remove (or rename) that container to be able to reuse that name.```

- It seems that ip port overlapped
- You can check container's infos by
    ```
    // docker ps -al
    ... IMAGE   ...   PORTS                                      ... ...
    
    ... cu11~   ...   0.0.0.0:8887->8888/tcp, :::8887->8888/tcp, ... ...

    ```
- Unfortunately, as far I know, there is no way to **just change/fix some option after make container**.

 