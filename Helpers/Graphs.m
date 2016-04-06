%% clean-up and set-up

clear
close all
clc

figure
xLength=1000;
axisMin=-100;
axisMax=100;
axis ([0 xLength axisMin axisMax])
grid on

addpath C:\WiiLab\WiiLab_Matlab\WiimoteFunctions

initializeWiimote;

%% initialize values

xW=zeros(1,1000);
t=1:1000;

%% graphing

while 1
    
    [xMoteAccel yMoteAccel zMoteAccel]=getWiimoteAccel;
%     [xNunAccel yNunAccel zNunAccel]=getNunchukAccel;
    
    clc

    if length(xW)==xLength
        xW=xW(2:end);
    end    
    
    xnew=xMoteAccel;
    xW=[xW xnew];
    
    clf
    plot(t,xW);
    axis ([0 xLength axisMin axisMax])
    
    pause(0.2)
    
    if isButtonPressed('A')
        break
    end
end

disconnectWiimote;