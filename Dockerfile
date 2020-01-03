FROM ros:lunar-ros-base

RUN apt-get update &&\
    apt-get install -y ros-$ROS_DISTRO-tf2 ros-$ROS_DISTRO-tf ros-$ROS_DISTRO-tf2-web-republisher &&\
    apt-get -y clean &&\
    apt-get -y purge &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download, build and install catkin repo from github
# ENV CATKIN_REPO https://github.com/RobotWebTools/tf2_web_republisher
# RUN /bin/bash -c "apt-get update && \
#                   source /opt/ros/$ROS_DISTRO/setup.bash && \
#                   mkdir -p /catkin_ws/src && \
#                   cd /catkin_ws/src && \
#                   git clone $CATKIN_REPO && \
#                   catkin_init_workspace && \
#                   rosdep update && \
#                   source /opt/ros/$ROS_DISTRO/setup.bash && \
#                   cd /catkin_ws/ && \
#                   rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y &&\
#                   catkin_make && \
#                   echo 'source /catkin_ws/devel/setup.bash' >> /root/.bashrc && \
#                   rm -rf /var/lib/apt/lists/"

# Need to have an entry point that sources the catkin workspace
# ADD ros_entrypoint.sh /

CMD ["rosrun", "tf2_web_republisher", "tf2_web_republisher"]