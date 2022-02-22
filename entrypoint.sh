#!/bin/bash
set -e

echo "128.16.29.12  nigel" >> /etc/hosts
echo "128.16.29.56  attocubenuc" >> /etc/hosts
export ROS_MASTER_URI="http://nigel:11311/"

# setup ros environment
source "/opt/ros/foxy/setup.bash"
exec "$@"