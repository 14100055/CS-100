function [ PlayerL PlayerR PlayerBody PlayerHead ] = moveBlue( PlayerL, PlayerR, PlayerBody, PlayerHead )
%MOVEPLAYER Summary of this function goes here
%   Detailed explanation goes here

increment=1;

xPlayerL = get(PlayerL, 'XData');
yPlayerL = get(PlayerL, 'YData');

xPlayerR = get(PlayerR, 'XData');
yPlayerR = get(PlayerR, 'YData');

xBody = get(PlayerBody, 'XData');
yBody = get(PlayerBody, 'YData');

xHead = get(PlayerHead, 'XData');
yHead = get(PlayerHead, 'YData');

if isButtonPressed('RIGHT')
    
    if xPlayerR(26,26)<=200
        xPlayerL = xPlayerL + increment;
        xPlayerR = xPlayerR + increment;
        xBody = xBody + increment;
        xHead = xHead + increment;
        
        set(PlayerL, 'XData', xPlayerL);
        set(PlayerR, 'XData', xPlayerR);
        set(PlayerBody, 'XData', xBody);
        set(PlayerHead, 'XData', xHead);
    end
    
elseif isButtonPressed('LEFT')
    
    if xPlayerL(26,1)>=0
        xPlayerL = xPlayerL - increment;
        xPlayerR = xPlayerR - increment;
        xBody = xBody - increment;
        xHead = xHead - increment;
        
        set(PlayerL, 'XData', xPlayerL);
        set(PlayerR, 'XData', xPlayerR);
        set(PlayerBody, 'XData', xBody);
        set(PlayerHead, 'XData', xHead);
    end
    
elseif isButtonPressed('UP')
    
    if yPlayerR(26,39)<=100
        yPlayerL = yPlayerL + increment;
        yPlayerR = yPlayerR + increment;
        yBody = yBody + increment;
        yHead = yHead + increment;
        
        set(PlayerL, 'YData', yPlayerL);
        set(PlayerR, 'YData', yPlayerR);
        set(PlayerBody, 'YData', yBody);
        set(PlayerHead, 'YData', yHead);
    end
    
elseif isButtonPressed('DOWN')
    
    if yHead(26,13)>=0
        yPlayerL = yPlayerL - increment;
        yPlayerR = yPlayerR - increment;
        yBody = yBody - increment;
        yHead = yHead - increment;
        
        set(PlayerL, 'YData', yPlayerL);
        set(PlayerR, 'YData', yPlayerR);
        set(PlayerBody, 'YData', yBody);
        set(PlayerHead, 'YData', yHead);
    end
end

end