FROM osrf/ros:humble-desktop

ENV TZ=Europe/Berlin

SHELL ["/bin/bash", "-c"]

RUN apt clean && \
    apt autoclean

# install essential tools
# default cmake version 3.10.2
RUN apt update && apt upgrade -y && \
    apt install -y \
    htop \
    tree \
    apt-utils \
    curl \
    wget \
    cmake \ 
    git \
    openssh-server \
    build-essential \
    libboost-all-dev \
    net-tools \
    vim \
    stress

# default gcc verison 7.5.0
RUN apt install -y libc-ares-dev libssl-dev gcc g++ make

# manually install ROS2

# # configure encoding
# RUN apt update && apt install locales && \
#     locale-gen en_US en_US.UTF-8 && \
#     update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
#     export LANG=en_US.UTF-8

# # add source for ROS2
# RUN apt update && apt install curl gnupg lsb-release && \
#     curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
#     echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# # install ROS2 to /opt/ros
# RUN apt update && apt upgrade && DEBIAN_FRONTEND=noninteractive apt install -y ros-humble-desktop

# set env var
RUN source /opt/ros/humble/setup.bash && \
    echo " source /opt/ros/humble/setup.bash" >> ~/.bashrc 

# install ros tools
RUN apt install -y python3-pip python3-colcon-ros && \
    DEBIAN_FRONTEND=noninteractive pip3 install rosdepc && \
    rosdepc init && \
    rosdepc update

