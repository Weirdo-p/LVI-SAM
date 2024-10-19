FROM osrf/ros:melodic-desktop-full
RUN apt-get update && apt-get install -y tmux software-properties-common zip unzip wget git cmake libatlas-base-dev libeigen3-dev libpcl-dev libsuitesparse-dev libglew-dev libgoogle-glog-dev && \
    add-apt-repository ppa:borglab/gtsam-release-4.0 && apt install -y libgtsam-dev libgtsam-unstable-dev && \
	wget -O ceres.zip https://github.com/ceres-solver/ceres-solver/archive/1.14.0.zip && \
	unzip ceres.zip -d ./ && \
    cd ceres-solver-1.14.0 && \
	mkdir ceres-bin && cd ceres-bin && \
	cmake .. && sudo make install -j4 && \
	cd ../../ 
#  	wget -O gtsam.zip https://github.com/borglab/gtsam/archive/4.0.2.zip && \
# 	unzip gtsam.zip && cd gtsam-4.0.2 && \
#    mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF .. && make -j2 && make install
    # sudo add-apt-repository ppa:borglab/gtsam-release-4.0 && sudo apt install libgtsam-dev libgtsam-unstable-dev

# WORKDIR /home/catkin_ws
# COPY ./ros_entrypoint.sh /
# RUN chmod 755 /ros_entrypoint.sh
# ENTRYPOINT ["/ros_entrypoint.sh"]
# 
# CMD ["bash"]
