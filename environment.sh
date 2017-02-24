#!/bin/bash

echo "Activating ROS..."
source /opt/ros/kinetic/setup.bash
echo "...done."

echo "Setting up PYTHONPATH."
export PYTHONPATH=/home/catkin_ws/src:$PYTHONPATH

echo "Setup ROS_HOSTNAME."
export ROS_HOSTNAME=$HOSTNAME.local
export DUCKIETOWN_ROOT=$HOME/duckietown
export DUCKIETOWN_WS_ROOT=$HOME/catkin_ws

echo "Building machines file..."
make -C  $DUCKIETOWN_ROOT
echo "...done"
echo "Activating development."
source $DUCKIETOWN_WS_ROOT/devel/setup.bash

# TODO: check that the time is >= 2015

# TODO: run a python script that checks all libraries are installed

exec "$@" #Passes arguments. Need this for ROS remote launching to work.
