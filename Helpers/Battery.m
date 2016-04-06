clear
close all
clc

addpath C:\WiiLab\WiiLab_Matlab\WiimoteFunctions

initializeWiimote;

Batt=getWiimoteBattery;

disconnectWiimote;