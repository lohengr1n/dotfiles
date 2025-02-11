Rem simple script for just running winget and installing everythin on a fresh system.
Rem the below powershell command sets the monitor sleep time to 30 seconds when locked
Rem powercfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK 30
choco install packages.config -y
