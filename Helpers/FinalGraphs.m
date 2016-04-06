%% clean-up and set-up
clear
close all
clc

figure
xLength=1000;
axisMin=-100;
axisMax=100;
% axis ([0 xLength axisMin axisMax])
hold on

addpath C:\WiiLab\WiiLab_Matlab\WiimoteFunctions

initializeWiimote;

%% initializing values

xW=zeros(1,1000);
yW=zeros(1,1000);
zW=zeros(1,1000);
t=1:1000;

%% graphing

while 1
    
    [xMoteAccel yMoteAccel zMoteAccel]=getWiimoteAccel;
    %     [xNunAccel yNunAccel zNunAccel]=getNunchukAccel;
    
    clc
    
    if length(xW)==xLength
        xW=xW(2:end);
    end
    
    if length(yW)==xLength
        yW=yW(2:end);
    end
    
    if length(zW)==xLength
        zW=zW(2:end);
    end
    
    xnew=2*xMoteAccel;
    xW=[xW xnew];
    
    ynew=2*yMoteAccel;
    yW=[yW ynew];
    
    znew=2*zMoteAccel;
    zW=[zW znew];
    
    subplot(3,1,1)
    axis ([0 xLength axisMin axisMax])
    plot(t,xW, 'b');
    
    axis ([0 xLength axisMin axisMax])
    
    subplot(3,1,2)
    axis ([0 xLength axisMin axisMax])
    plot(t,yW, 'r');
    axis ([0 xLength axisMin axisMax])
    
    subplot(3,1,3)
    axis ([0 xLength axisMin axisMax])
    plot(t,zW, 'g');
    axis ([0 xLength axisMin axisMax])
    
    pause(0.05)
    
    if isButtonPressed('A')
        break
    end
end

disconnectWiimote;