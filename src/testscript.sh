cd ~/src/Firmware
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/posix_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd):$(pwd)/Tools/sitl_gazebo
roslaunch px4 four_uav_mavros_sitl.launch > /dev/null &
#matlab -nosplash -r "rosinit; pause(5); rosshutdown; exit"
sleep 30
#cd ~/src/Firmware/integrationtests/python_src/px4_it/mavros
#./four_uav_offb_poxstl.py &
matlab -r "rosinit; cd ~/src/Firmware/integrationtests/python_src/px4_it/mavros; system('./four_uav_offb_poxstl.py &'); cd /home/rasp/Documents/Matlab_Code/resilient_target_tracking/gazebo_tra_assign; timer_tra_assign; rosshutdown; exit"
killall gazebo gzserver gzclient roslaunch
