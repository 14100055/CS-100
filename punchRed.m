function [ PlayerL PlayerR RedScore ] = punchRed( PlayerL, PlayerR, EnemyBody, EnemyHead, amp, RedScore )
%ENEMYPUNCH Summary of this function goes here
%   Detailed explanation goes here

randomizer=randi(6);

incrementx=1.1;
eX=0;
incrementExp=0.108;
distance=22.5;

%% initializing values

xPlayerL = get(PlayerL, 'XData');
yPlayerL = get(PlayerL, 'YData');
zPlayerL = get(PlayerL, 'ZData');

xPlayerR = get(PlayerR, 'XData');
yPlayerR = get(PlayerR, 'YData');
zPlayerR = get(PlayerR, 'ZData');

xEnemyHead = get(EnemyHead, 'XData');
yEnemyHead = get(EnemyHead, 'YData');
zEnemyHead = get(EnemyHead, 'ZData');

xEnemyBody = get(EnemyBody, 'XData');
yEnemyBody = get(EnemyBody, 'YData');

%% straight punch

if randomizer==1
    
    for forward=1:15
        xPlayerL = xPlayerL - 0.8;
        yPlayerL = yPlayerL - 2.2;
        zPlayerL = zPlayerL + 1.6;
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL, 'ZData', zPlayerL);
        pause(0.0001)
    end
    
    xNorm=(xEnemyHead(16,11)-xPlayerL(16,11))^2;
    yNorm=(yEnemyHead(26,26)-yPlayerL(26,26))^2;
    zNorm=(zEnemyHead(26,26)-zPlayerL(26,26))^2;
    normSquared=xNorm+yNorm+zNorm;
    norm=sqrt(normSquared);
    
    if norm<=distance
        RedScore=RedScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=15:-1:1
        xPlayerL = xPlayerL + 0.8;
        yPlayerL = yPlayerL + 2.2;
        zPlayerL = zPlayerL - 1.6;
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL, 'ZData', zPlayerL);
        pause(0.0001)
    end
    
    randomizer=0;
    
end

if randomizer==4
    
    for forward=1:15
        xPlayerR = xPlayerR + 0.8;
        yPlayerR = yPlayerR - 2.2;
        zPlayerR = zPlayerR + 1.6;
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR, 'ZData', zPlayerR);
        pause(0.0001)
    end
    
    xNorm=(xEnemyHead(16,11)-xPlayerR(16,11))^2;
    yNorm=(yEnemyHead(26,26)-yPlayerR(26,26))^2;
    zNorm=(zEnemyHead(26,26)-zPlayerR(26,26))^2;
    normSquared=xNorm+yNorm+zNorm;
    norm=sqrt(normSquared);
    
    if norm<=distance
        RedScore=RedScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=15:-1:1
        xPlayerR = xPlayerR - 0.8;
        yPlayerR = yPlayerR + 2.2;
        zPlayerR = zPlayerR - 1.6;
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR, 'ZData', zPlayerR);
        pause(0.0001)
    end
    
    randomizer=0;
    
end

%% uppercut

if randomizer==2
    
    for forward=1:15
        xPlayerL = xPlayerL - 0.8;
        yPlayerL = yPlayerL - 2*incrementx;
        z = exp(eX + 2*forward*incrementExp);
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL, 'ZData', zPlayerL + z);
        pause(0.0001)
    end
    
    xNorm=(xEnemyHead(16,11)-xPlayerL(16,11))^2;
    yNorm=(yEnemyHead(26,26)-yPlayerL(26,26))^2;
    zNorm=(zEnemyHead(26,26)-(zPlayerL(26,26)+z))^2;
    normSquared=xNorm+yNorm+zNorm;
    norm=sqrt(normSquared);
    
    if norm<=distance
        RedScore=RedScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=15:-1:1
        xPlayerL = xPlayerL + 0.8;
        yPlayerL = yPlayerL + 2*incrementx;
        z = exp(eX + 2*backward*incrementExp);
        if backward==1
            z=0;
        end
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL, 'ZData', zPlayerL + z);
        pause(0.0001)
    end
    
    randomizer=0;
    
end

if randomizer==5
    
    for forward=1:15
        xPlayerR = xPlayerR + 0.8;
        yPlayerR = yPlayerR - 2*incrementx;
        z = exp(eX + 2*forward*incrementExp);
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR, 'ZData', zPlayerR + z );
        pause(0.0001)
    end
    
    xNorm=(xEnemyHead(16,11)-xPlayerR(16,11))^2;
    yNorm=(yEnemyHead(26,26)-yPlayerR(26,26))^2;
    zNorm=(zEnemyHead(26,26)-(zPlayerR(26,26)+z))^2;
    normSquared=xNorm+yNorm+zNorm;
    norm=sqrt(normSquared);
    
    if norm<=distance
        RedScore=RedScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=15:-1:1
        xPlayerR = xPlayerR - 0.8;
        yPlayerR = yPlayerR + 2*incrementx;
        z = exp(eX + 2*backward*incrementExp);
        if backward==1
            z=0;
        end
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR, 'ZData', zPlayerR + z);
        pause(0.0001)
    end
    
    randomizer=0;
    
end

%% jab

if randomizer==3
    
    for forward=1:18
        xPlayerL = xPlayerL - 0.65;
        yPlayerL = yPlayerL - 2.2;
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL);
        pause(0.0001)
    end
    
    if ((xPlayerR(26,1)>=xEnemyBody(1,11) && xPlayerR(26,1)<=xEnemyBody(1,1)) || (xPlayerR(1,1)>=xEnemyBody(1,11) && xPlayerR(1,1)<=xEnemyBody(1,1)) || (xPlayerR(26,26)>=xEnemyBody(1,11) && xPlayerR(26,26)<=xEnemyBody(1,1))) && ((yPlayerR(26,13)>=yEnemyBody(1,16) && yPlayerR(26,13)<=yEnemyBody(1,6)) || (yPlayerR(26,26)>=yEnemyBody(1,16) && yPlayerR(26,26)<=yEnemyBody(1,6)))
        RedScore=RedScore+1;
        wavplay(amp, 'async');
    end

    
    for backward=18:-1:1
        xPlayerL = xPlayerL + 0.65;
        yPlayerL = yPlayerL + 2.2;
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL);
        pause(0.0001)
    end
    
    randomizer=0;
    
end

if randomizer==6
    
    for forward=1:18
        xPlayerR = xPlayerR + 0.65;
        yPlayerR = yPlayerR - 2.2;
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR);
        pause(0.0001)
    end
    
    if ((xPlayerR(26,1)>=xEnemyBody(1,11) && xPlayerR(26,1)<=xEnemyBody(1,1)) || (xPlayerR(1,1)>=xEnemyBody(1,11) && xPlayerR(1,1)<=xEnemyBody(1,1)) || (xPlayerR(26,26)>=xEnemyBody(1,11) && xPlayerR(26,26)<=xEnemyBody(1,1))) && ((yPlayerR(26,13)>=yEnemyBody(1,16) && yPlayerR(26,13)<=yEnemyBody(1,6)) || (yPlayerR(26,26)>=yEnemyBody(1,16) && yPlayerR(26,26)<=yEnemyBody(1,6)))
        RedScore=RedScore+1;
        wavplay(amp, 'async');
    end

    
    for backward=18:-1:1
        xPlayerR = xPlayerR - 0.65;
        yPlayerR = yPlayerR + 2.2;
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR);
        pause(0.0001)
    end
    
    randomizer=0;
    
end

end