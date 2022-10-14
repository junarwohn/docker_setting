NV_GPU=0 nvidia-docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/j/workspace:/home/jd/workspace -e DISPLAY=$DISPLAY -p 8888:8888 -p 9998:9998 --name py3tf241 py3tf241 bash
