FROM ros:noetic-perception

RUN apt-get update && apt-get install -y \
    python3-catkin-tools \
    python3-rosdep \
    python3-rosinstall-generator \
    python3-vcstool \
    python3-pip \
    build-essential \
    ros-noetic-rqt \
    git \
    ssh \
    usbutils \
    iputils-ping \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install catkin_tools
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


RUN mkdir -p /catkin_ws/src

WORKDIR /catkin_ws/src
RUN git clone https://github.com/ros-drivers/usb_cam.git

WORKDIR /catkin_ws/
RUN ["/bin/bash", "-c", "source /opt/ros/noetic/setup.bash && \
    catkin build"]

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "bash" ]