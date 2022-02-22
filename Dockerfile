ARG ROSDISTRO=foxy

FROM ros:$ROSDISTRO

ARG ROSDISTRO

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-flake8 \
    python3-pytest-cov \
    python3-rosdep \
    python3-setuptools \
    python3-vcstool \
    python3-opencv \
    build-essential \
    # ros-$ROSDISTRO-rqt \
    # ros-$ROSDISTRO-rqt-topic \
    # ros-$ROSDISTRO-rqt-top \
    # ros-$ROSDISTRO-rqt-srv \
    # ros-$ROSDISTRO-rqt-shell \
    # ros-$ROSDISTRO-rqt-service-caller \
    # ros-$ROSDISTRO-rqt-publisher \
    # ros-$ROSDISTRO-rqt-reconfigure \
    # ros-$ROSDISTRO-rqt-msg \
    # ros-$ROSDISTRO-rqt-console \
    # ros-$ROSDISTRO-rqt-common-plugins \
    ros-$ROSDISTRO-usb-cam \
    ros-$ROSDISTRO-image-pipeline \
    ros-$ROSDISTRO-vision-opencv \
    libusb-1.0-0-dev \
    git \
    ssh \
    usbutils \
    iputils-ping \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/bin/bash", "-c", "ros2 run usb_cam usb_cam_node_exe" ]
