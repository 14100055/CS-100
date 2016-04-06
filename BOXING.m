%% clean-up

clc

[amp] = wavread('Gun357mag.wav');
move=0;
BlueScore=0;
RedScore=0;
exit=0;

%% boxing ring background

[ axisW axisL ] = BoxingRing();

%% making of two players

[leftBlueFist rightBlueFist BlueBody BlueHead leftRedFist rightRedFist ] = Bodies();
% axis off

%%  detecting the punches

addpath C:\WiiLab\WiiLab_Matlab\WiimoteFunctions

initializeWiimote;

while 1
    
    [ hit punchType1 punchType2 shouldBreak ] = detectPunch( );
    
    [ hit punchType1 punchType2 BlueScore ] = punchBlue( leftBlueFist, rightBlueFist, hit, punchType1, punchType2, amp, BlueScore);
    
    [ leftBlueFist rightBlueFist BlueBody BlueHead ] = moveBlue(leftBlueFist, rightBlueFist, BlueBody, BlueHead);
    
    if rand<=0.2
        [ leftRedPunch rightRedPunch RedScore ] = punchRed(leftRedFist, rightRedFist, BlueBody, BlueHead, amp, RedScore);
    end
    
    xlabel(['Blue''s Score = ' num2str(BlueScore)]);
    
    ylabel(['Red''s Score = ' num2str(RedScore)]);
    
    pause(0.001)
    
    if BlueScore==10
        title('YOU WIN!!!')
        win=1;
        break
    end
    
    if RedScore==10
        title('YOU LOSE!!!')
        lose=1;
        break
    end
    
    if shouldBreak==1
        exit=1;
        break
    end
    
    if isButtonPressed('HOME')
        close Figure 1
        disconnectWiimote;
        Titlescreen
        break
    end
    
end

if win==1
    
    while 1
        if isButtonPressed('HOME')
            close Figure 1
            disconnectWiimote
            Titlescreen
            break
        elseif isButtonPressed('B')
            exit=1;
            break
        end
        pause(0.001)
    end
    
end

if lose==1
    
    while 1
        if isButtonPressed('HOME')
            close Figure 1
            disconnectWiimote
            Titlescreen
            break
        elseif isButtonPressed('B')
            exit=1;
            break
        end
        pause(0.0001)
    end
    
end

if exit==1
    
    disconnectWiimote;
    close all
    clc
    
end