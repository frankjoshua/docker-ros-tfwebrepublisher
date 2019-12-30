# docker-ros-bridge-suite
Building
```
docker build . -t frankjoshua/ros-tf2webrepublisher
```
Running
```
docker run --network "host" -e ROS_IP=$ROS_IP -e ROS_MASTER_URI=$ROS_MASTER_URI frankjoshua/ros-tf2webrepublisher
```
