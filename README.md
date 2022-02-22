## USB CAM
`rosrun usb_cam usb_cam_node _pixel_format:=yuyv`

Tested on logitech webcam

## Docker
### Build

There is a docker file that contains the packages and all the dependencies. 
Where the general workflow to build the image:  

- Clone the repo
- Build the docker image

```bash
cd ros_webcam
docker build --pull --rm -f ./Dockerfile  -t ros_webcam:foxy .
```

If you are changing the Dockerfile remove the `--rm` tag to keep your intermediate builds. 

### Running

My approach (2.3 from the [ROS guide](http://wiki.ros.org/docker/Tutorials/GUI))

```bash
docker run -it \
    --rm \
    --net=host \
    --privileged \
    ros_webcam:foxy
```

