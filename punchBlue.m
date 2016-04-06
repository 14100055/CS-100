function [ hit punchType1 punchType2 BlueScore ] = punchBlue( PlayerL, PlayerR, hit, punchType1, punchType2, amp, BlueScore )
%MOVEFIST Move fists
%         Straight punch should go straight towards head. While uppercut
%         goes towards head in projectile motion upwards (made gravity
%         zero). Jab should go straight forwards towards stomach.

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

%% straight punch

if hit==1
    
    for forward=1:15
        xPlayerL = xPlayerL + 0.8;
        yPlayerL = yPlayerL + 2.2;
        zPlayerL = zPlayerL + 1.6;
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL, 'ZData', zPlayerL);
        pause(0.0001)
    end
    
    xNorm=(100-xPlayerL(16,11))^2;
    yNorm=(135-yPlayerL(26,26))^2;
    zNorm=(80-zPlayerL(26,26))^2;
    normSquared=xNorm+yNorm+zNorm;
    norm=sqrt(normSquared);
    
    if norm<=distance
        BlueScore=BlueScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=15:-1:1
        xPlayerL = xPlayerL - 0.8;
        yPlayerL = yPlayerL - 2.2;
        zPlayerL = zPlayerL - 1.6;
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL, 'ZData', zPlayerL);
        pause(0.0001)
    end
    
    hit=0;
    punchType1=0;
    
end

if hit==4
    
    for forward=1:15
        xPlayerR = xPlayerR - 0.8;
        yPlayerR = yPlayerR + 2.2;
        zPlayerR = zPlayerR + 1.6;
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR, 'ZData', zPlayerR);
        pause(0.0001)
    end

    xNorm=(100-xPlayerR(16,11))^2;
    yNorm=(135-yPlayerR(26,26))^2;
    zNorm=(80-zPlayerR(26,26))^2;
    normSquared=xNorm+yNorm+zNorm;
    norm=sqrt(normSquared);
    
    if norm<=distance
        BlueScore=BlueScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=15:-1:1
        xPlayerR = xPlayerR + 0.8;
        yPlayerR = yPlayerR - 2.2;
        zPlayerR = zPlayerR - 1.6;
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR, 'ZData', zPlayerR);
        pause(0.0001)
    end
    
    hit=0;
    punchType2=0;
    
end

%% uppercut

if hit==2
    
    for forward=1:15
        xPlayerL = xPlayerL + 0.8;
        yPlayerL = yPlayerL + 2*incrementx;
        z = exp(eX + 2*forward*incrementExp);
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL, 'ZData', zPlayerL + z);
        pause(0.0001)
    end
    
    xNorm=(100-xPlayerL(16,11))^2;
    yNorm=(135-yPlayerL(26,26))^2;
    zNorm=(80-(zPlayerL(26,26)+z))^2;
    normSquared=xNorm+yNorm+zNorm;
    norm=sqrt(normSquared);
    
    if norm<=distance
        BlueScore=BlueScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=15:-1:1
        xPlayerL = xPlayerL - 0.8;
        yPlayerL = yPlayerL - 2*incrementx;
        z = exp(eX + 2*backward*incrementExp);
        if backward==1
            z=0;
        end
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL, 'ZData', zPlayerL + z);
        pause(0.0001)
    end
    
    hit=0;
    punchType1=0;
    
end

if hit==5
    
    for forward=1:15
        xPlayerR = xPlayerR - 0.8;
        yPlayerR = yPlayerR + 2*incrementx;
        z = exp(eX + 2*forward*incrementExp);
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR, 'ZData', zPlayerR + z );
        pause(0.0001)
    end
    
    xNorm=(100-xPlayerR(16,11))^2;
    yNorm=(135-yPlayerR(26,26))^2;
    zNorm=(80-(zPlayerR(26,26)+z))^2;
    normSquared=xNorm+yNorm+zNorm;
    norm=sqrt(normSquared);
    
    if norm<=distance
        BlueScore=BlueScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=15:-1:1
        xPlayerR = xPlayerR + 0.8;
        yPlayerR = yPlayerR - 2*incrementx;
        z = exp(eX + 2*backward*incrementExp);
        if backward==1
            z=0;
        end
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR, 'ZData', zPlayerR + z);
        pause(0.0001)
    end
    
    hit=0;
    punchType2=0;
    
end

%% jab

if hit==3
    
    for forward=1:18
        xPlayerL = xPlayerL + 0.65;
        yPlayerL = yPlayerL + 2.2;
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL);
        pause(0.0001)
    end
    
    if ((xPlayerL(26,1)>=90 && xPlayerL(26,1)<=110) || (xPlayerL(1,1)>=90 && xPlayerL(1,1)<=110) || (xPlayerL(26,26)>=90 && xPlayerL(26,26)<=110)) && ((yPlayerL(26,13)>=125 && yPlayerL(26,13)<=145) || (yPlayerL(26,26)>=125 && yPlayerL(26,26)<=145))
        BlueScore=BlueScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=18:-1:1
        xPlayerL = xPlayerL - 0.65;
        yPlayerL = yPlayerL - 2.2;
        set(PlayerL, 'XData', xPlayerL, 'YData', yPlayerL);
        pause(0.0001)
    end
    
    hit=0;
    punchType1=0;
    
end

if hit==6
    
    for forward=1:18
        xPlayerR = xPlayerR - 0.65;
        yPlayerR = yPlayerR + 2.2;
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR);
        pause(0.0001)
    end
    
    if ((xPlayerR(26,1)>=90 && xPlayerR(26,1)<=110) || (xPlayerR(1,1)>=90 && xPlayerR(1,1)<=110) || (xPlayerR(26,26)>=90 && xPlayerR(26,26)<=110)) && ((yPlayerR(26,13)>=125 && yPlayerR(26,13)<=145) || (yPlayerR(26,26)>=125 && yPlayerR(26,26)<=145))
        BlueScore=BlueScore+1;
        wavplay(amp, 'async');
    end
    
    for backward=18:-1:1
        xPlayerR = xPlayerR + 0.65;
        yPlayerR = yPlayerR - 2.2;
        set(PlayerR, 'XData', xPlayerR, 'YData', yPlayerR);
        pause(0.0001)
    end
    
    hit=0;
    punchType2=0;
    
end

end