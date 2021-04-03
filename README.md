# FedoraNvidiaOptimusSwitchGPU
A small script to switch between running with iGPU and dGPU.
# Tested on
Fedora 33 with Nvidia RTX 2060 with driver 460.67
# Instructions
1. Check if your `/etc/X11/xorg.conf.d` has a file called `nvidia.conf`.
2. Make a new file called `nvidia.conf.bak` with `Option "PrimaryGPU" "yes"` in the Sections
3. In the terminal, run `./SwitchGPU.sh`
In case ./SwitchGPU.sh doesn't work, type `chmod +x ./SwitchGPU.sh` and do step 2 again.
# Details
Check if your `/etc/X11/xorg.conf.d` has a file called `nvidia.conf`.
A typical nvidia.conf looks like:
```
#This file is provided by xorg-x11-drv-nvidia
#Do not edit

Section "OutputClass"
	Identifier "nvidia"
	MatchDriver "nvidia-drm"
	Driver "nvidia"
	Option "AllowEmptyInitialConfiguration"
	Option "SLI" "Auto"
	Option "BaseMosaic" "on"
EndSection

Section "ServerLayout"
	Identifier "layout"
	Option "AllowNVIDIAGPUScreens"
EndSection
```
The above config runs on iGPU and if we want the system to run on dGPU instead, the file will look like this
```
#This file is provided by xorg-x11-drv-nvidia
#Do not edit

Section "OutputClass"
	Identifier "nvidia"
	MatchDriver "nvidia-drm"
	Driver "nvidia"
	Option "AllowEmptyInitialConfiguration"
	Option "SLI" "Auto"
	Option "BaseMosaic" "on"
  	Option "PrimaryGPU" "yes"
EndSection

Section "ServerLayout"
	Identifier "layout"
	Option "AllowNVIDIAGPUScreens"
  	Option "PrimaryGPU" "yes"
EndSection
```
`Option "PrimaryGPU" "yes"` will make the system use the dGPU instead of the iGPU.
The script basically switches between the 2 files and reboots.
