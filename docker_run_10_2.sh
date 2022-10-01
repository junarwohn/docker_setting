NV_GPU=0 nvidia-docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/j/workspace:/home/jd/workspace -e DISPLAY=$DISPLAY -p 8887:8888 -p 9997:9998 --name py3tf241_cu10 cu10_nn8_1804  bash
