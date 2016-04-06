clear
close all
clc

addpath C:\WiiLab\WiiLab_Matlab\WiimoteFunctions

initializeWiimote;

while 1
    
    [xW yW zW]=getWiimoteAccel;
    [xN yN zN] = getNunchukAccel;
    [x y]=getNunchukJoystick;
    clc;
    disp([xW yW zW])
    disp([xN yN zN])
    disp([x y])
    pause(0.2);
    
    if isButtonPressed('A')
        break;
    end
end

disconnectWiimote;