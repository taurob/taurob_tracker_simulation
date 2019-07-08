FROM osrf/ros:melodic-desktop-full

# Install ROS packages
RUN apt-get update && apt-get install -y \
    ros-melodic-robot-pose-ekf \
    ros-melodic-gazebo-ros \
    ros-melodic-control-toolbox \
    ros-melodic-controller-manager \
    ros-melodic-gazebo-ros-control \
    ros-melodic-hector-xacro-tools \
    ros-melodic-hector-gazebo-plugins \
    ros-melodic-gps-common \
    ros-melodic-robot-pose-ekf \ 
    ros-melodic-joint-state-controller \
    ros-melodic-effort-controllers \
    ros-melodic-position-controllers \
    ros-melodic-urg-node \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Create a catkin workspace
WORKDIR /root/catkin_ws/src
RUN /bin/bash -c 'source /opt/ros/melodic/setup.bash; cd /root/catkin_ws; catkin_make'

# Install dependencies
RUN \
    git clone https://github.com/tu-darmstadt-ros-pkg/gazebo_ros_control_select_joints; \
    git clone https://github.com/roboticsgroup/roboticsgroup_gazebo_plugins;

COPY taurob_tracker_bringup ./taurob_tracker_bringup
COPY taurob_tracker_control ./taurob_tracker_control
COPY taurob_tracker_description ./taurob_tracker_description
COPY taurob_tracker_gazebo ./taurob_tracker_gazebo

# Build the workspace
RUN /bin/bash -c 'source /root/catkin_ws/devel/setup.bash; cd /root/catkin_ws; catkin_make'

# Modify entry point script to source costum workspace upon container start
RUN /bin/sed -i \
    '/source "\/opt\/ros\/$ROS_DISTRO\/setup.bash"/a source "\/root\/catkin_ws\/devel\/setup.bash"' \
    /ros_entrypoint.sh

ENV SVGA_VGPU10 0
CMD ["roslaunch", "taurob_tracker_bringup", "bringup.launch"]
