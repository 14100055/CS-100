function [ hit punchType1 punchType2 shouldBreak] = detectPunch( )
%DETECTPUNCH detects what kind of punch it is. Straight fist, uppercut or
%            jab.
%            Detects from each fist whether its straight punch, uppercut or
%            jab. And detects from one fist only if other fist is not punching
%            at that moment.

punchType1 = 0;
punchType2 = 0;
hit = 0;
shouldBreak = 0;

%% graphing


[xMoteAccel yMoteAccel zMoteAccel]=getWiimoteAccel;
[xNunAccel yNunAccel zNunAccel]=getNunchukAccel;

%% getting values, then updating vector

xWnew=2*xMoteAccel;

yWnew=2*yMoteAccel;

zWnew=2*zMoteAccel;

xNnew=2*xNunAccel;

yNnew=2*yNunAccel;

zNnew=2*zNunAccel;

%% wiimote graphs - left fist

if punchType1==0 && punchType2==0
    
    if (zWnew>=70) && (xWnew<=40)
        title('What A Punch!!!')
        hit=1;
        punchType1=1;
    elseif (xWnew>=40) && (yWnew<=40) && (zWnew<=30)
        title('Uppercut!')
        hit=2;
        punchType1=1;
    elseif (xWnew>=30) && (yWnew<=-30)
        title('Jab!')
        hit=3;
        punchType1=1;
    end
    
end

%% nunchuk graphs - right fist

if punchType1==0 && punchType2==0
    
    if (zNnew>=40) && (xNnew>=-20)
        title('What A Punch!!!')
        hit=4;
        punchType2=1;
    elseif ((xNnew>=-30) || (xNnew<=40)) && (yNnew<=-40) && (zNnew>=-20)
        title('Uppercut!')
        hit=5;
        punchType2=1;
    elseif (xNnew<=10) && (yNnew<=10) && (zNnew>=30)
        title('Jab!')
        hit=6;
        punchType2=1;
    end
    
end

pause(0.01)

if isButtonPressed('B')
    shouldBreak=1;
end

end