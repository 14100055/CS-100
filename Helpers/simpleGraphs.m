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
xN=zeros(1,1000);
yN=zeros(1,1000);
zN=zeros(1,1000);
t=1:1000;

%% graphing

while 1
    
    [xMoteAccel yMoteAccel zMoteAccel]=getWiimoteAccel;
    [xNunAccel yNunAccel zNunAccel]=getNunchukAccel;
    
    clc
    
    %% adjusting vector length
    
    if length(xW)==xLength
        xW=xW(2:end);
    end
    
    if length(yW)==xLength
        yW=yW(2:end);
    end
    
    if length(zW)==xLength
        zW=zW(2:end);
    end
    
    if length(xN)==xLength
        xN=xN(2:end);
    end
    
    if length(yN)==xLength
        yN=yN(2:end);
    end
    
    if length(zN)==xLength
        zN=zN(2:end);
    end
    
    %% getting values, then updating vector
    
    xWnew=2*xMoteAccel;
    xW=[xW xWnew];
    
    yWnew=2*yMoteAccel;
    yW=[yW yWnew];
    
    zWnew=2*zMoteAccel;
    zW=[zW zWnew];
    
    xNnew=2*xNunAccel;
    xN=[xN xNnew];
    
    yNnew=2*yNunAccel;
    yN=[yN yNnew];
    
    zNnew=2*zNunAccel;
    zN=[zN zNnew];
    
%% plotting graphs    
    
%% wiimote graphs - left fist

    subplot(3,2,1)
    axis ([0 xLength axisMin axisMax])
    plot(t,xW, 'b');
    if (zWnew>=70) && (xWnew<=40)
        title('What A Punch!!!')
    elseif (xWnew>=60) && (yWnew<=40) && (zWnew>=40)
        title('Uppercut!')
    elseif (xWnew>=30) && (yWnew<=-30)
        title('Jab!')
    end
    axis ([0 xLength axisMin axisMax])
%     ylabel('X Accel')
    
    subplot(3,2,3)
    axis ([0 xLength axisMin axisMax])
    plot(t,yW, 'r');
    axis ([0 xLength axisMin axisMax])
%     ylabel('Y Accel')
    
    subplot(3,2,5)
    axis ([0 xLength axisMin axisMax])
    plot(t,zW, 'g');
    axis ([0 xLength axisMin axisMax])
%     ylabel('Z Accel')
%     xlabel({'t','','WiiMote Accel'})

%% nunchuk graphs - right fist

    subplot(3,2,2)
    axis ([0 xLength axisMin axisMax])
    plot(t,xN, 'b');
    if (zNnew>=45) && (xNnew>=-20)
        title('What A Punch!!!')
    elseif ((xNnew>=-30) || (xNnew<=40)) && (yNnew<=-40) && (zNnew>=-20)
        title('Uppercut!')
    elseif (xNnew<=10) && (yNnew<=10) && (zNnew>=25)
        title('Jab!')
    end
    axis ([0 xLength axisMin axisMax])
%     ylabel('X Accel')
    
    subplot(3,2,4)
    axis ([0 xLength axisMin axisMax])
    plot(t,yN, 'r');
    axis ([0 xLength axisMin axisMax])
%     ylabel('Y Accel')
    
    subplot(3,2,6)
    axis ([0 xLength axisMin axisMax])
    plot(t,zN, 'g');
    axis ([0 xLength axisMin axisMax])    
%     ylabel('Z Accel')
%     xlabel({'t','','Nunchuk Accel'})
    
    pause(0.01)
    
    if isButtonPressed('A')
        break
    end
end

disconnectWiimote;