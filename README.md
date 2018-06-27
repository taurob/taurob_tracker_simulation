# taurobtrackerapi

*taurob tracker ROS packages for simulation*

 Author: Clemens Hammer, taurob GmbH
         Lukas Silberbauer, taurob GmbH

 Date: 27 June 2018

This repository contains packages to simulate a taurob tracker robot base

Copyright (c) 2018 taurob GmbH. All rights reserved.
 Perfektastrasse 57/7, 1230 Wien, Austria. office@taurob.com

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


## Compilation and setup

Simply place the packages in your ROS workspace, and compile using catkin_make.

To start a simulation two additional packages are required. Therefore change into your workspace source directory and clone the repositories:

 * gazebo_ros_control_selected_joint: https://github.com/tu-darmstadt-ros-pkg/gazebo_ros_control_select_joints.git

 * roboticsgroup_gazebo_plugin: https://github.com/roboticsgroup/roboticsgroup_gazebo_plugins.git

## Simulation bringup

To start the simulation execute the following command:

* roslaunch taurob_tracker_bringup bringup.launch


## Moving the robot

To move the robot base the following topics are available:

* /taurob_tracker/cmd_vel_raw

* /taurob_tracker/joint_flipper_position_controller/command
