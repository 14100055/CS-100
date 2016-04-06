%% clean-up and set-up
clear
close all
clc

figure
xLength=1000;
axisMin=-100;
axisMax=100;
axis ([0 xLength axisMin axisMax])
hold on

addpath C:\WiiLab\WiiLab_Matlab\WiimoteFunctions

initializeWiimote;

%% initializing values

xN=zeros(1,1000);
yN=zeros(1,1000);
zN=zeros(1,1000);
t=1:1000;

%% graphing

while 1
    
%     [xMoteAccel yMoteAccel zMoteAccel]=getWiimoteAccel;
        [xNunAccel yNunAccel zNunAccel]=getNunchukAccel;
    
    clc
    
    if length(xN)==xLength
        xN=xN(2:end);
    end
    
    if length(yN)==xLength
        yN=yN(2:end);
    end
    
    if length(zN)==xLength
        zN=zN(2:end);
    end
    
    xnew=2*xNunAccel;
    xN=[xN xnew];
    
    ynew=2*yNunAccel;
    yN=[yN ynew];
    
    znew=2*zNunAccel;
    zN=[zN znew];
    
    clf
    plot(t,xN, 'b');
    hold on
    plot(t,yN, 'r');
    plot(t,zN, 'g');
    axis ([0 xLength axisMin axisMax])
    
    pause(0.01)
    
    if isButtonPressed('A')
        break
    end
end

disconnectWiimote;