#!/bin/sh
sudo cp /etc/X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf.t
sudo mv /etc/X11/xorg.conf.d/nvidia.conf.bak /etc/X11/xorg.conf.d/nvidia.conf
sudo mv /etc/X11/xorg.conf.d/nvidia.conf.t /etc/X11/xorg.conf.d/nvidia.conf.bak
reboot
