#NV_GPU=0 nvidia-docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/j/workspace:/home/jd/workspace -e DISPLAY=$DISPLAY -p 8888:8888 -p 9998:9998 --name py3tf241 cu11_nn8_1804 bash
#docker run --gpus all -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/j/workspace:/home/jd/workspace -e DISPLAY=$DISPLAY -p 8888:8888 -p 9998:9998 --shm-size=2G --name py3tf291 l4t_jetpack bash
#docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/j/workspace:/home/jd/workspace -v /run/jtop.sock:/run/jtop.sock -e DISPLAY=$DISPLAY -p 8888:8888 -p 9998:9998 --shm-size=2G --name py3tf291 l4t_jetpack bash
docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/j/workspace:/home/jd/workspace -e DISPLAY=$DISPLAY -p 8888:8888 -p 9998:9998 --shm-size=2G --name py3tf291 l4t_tf_291 bash

