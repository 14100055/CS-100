clear
close all
clc

addpath C:\WiiLab\WiiLab_Matlab\WiimoteFunctions

initializeWiimote;

while 1

    [x y z] = getNunchukAccel;
    clc;
    disp([x y z]);
    pause(0.2);
    
    if isButtonPressed('A')
        break;
    end
end

disconnectWiimote;