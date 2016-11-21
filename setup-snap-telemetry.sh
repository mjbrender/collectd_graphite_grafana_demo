#!/bin/bash

# install latest package 
cd ~ 
curl -s https://packagecloud.io/install/repositories/intelsdi-x/snap/script.deb.sh | sudo bash
sudo apt-get install snap-telemetry=0.19.0-1trusty

# download plugins we want to use and place them in the autodiscovery path
cd /opt/snap/plugins/
sudo wget https://s3-us-west-2.amazonaws.com/snap.ci.snap-telemetry.io/plugins/snap-plugin-collector-cpu/latest/linux/x86_64/snap-plugin-collector-cpu
sudo wget https://s3-us-west-2.amazonaws.com/snap.ci.snap-telemetry.io/plugins/snap-plugin-collector-swap/latest/linux/x86_64/snap-plugin-collector-swap
sudo wget https://s3-us-west-2.amazonaws.com/snap.ci.snap-telemetry.io/plugins/snap-plugin-collector-psutil/latest/linux/x86_64/snap-plugin-collector-psutil
sudo wget https://gist.githubusercontent.com/mjbrender/26b9131e6ee1fd8b0419f1b283ae56f4/raw/4663651f7d2678c49b889172f8761d35a7365480/publish-to-graphite.json

# make sure they're executible or they won't load
sudo chmod +x *

# restart the service so Snap picks up these plugins and Task Manifest 
sudo service snap-telemetry restart

# make sure you see stuff here 
snaptel plugin list 
snaptel task list 
echo "now run \"snaptel task watch <task-id>\" to watch live data coming from Snap!"