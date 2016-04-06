clear all
close all
clc

%% TitleScreen

figure
axis([0 700 0 368]);
hold on
TitleImage=imread('SportCar.jpg');
imagesc(TitleImage);
set(gca,'ydir','reverse');
start = 0;
exit=0;
[imHeight imWidth Depth] = size(TitleImage);
% axis off

%% Buttons

addpath C:\WiiLab\WiiLab_Matlab\WiimoteFunctions

initializeWiimote;

while 1
    
    while 1
        
        if isButtonPressed('A')
            start=1;
            break
        end
        
        if isButtonPressed('PLUS')
            instruct=msgbox({'Punch with WiiMote in left hand to move player''s left fist.';'';'Punch with Nunchuk in right hand to move player''s right fist.'}, 'Instructions');
            
            while 1
                if isButtonPressed('PLUS')
                    close Instructions
                    break
                end
            end
            
        end
        
        if isButtonPressed('MINUS')
            about=msgbox({'Boxing World Championship. Demo Version.   Author: Saad Naveed Ismail.', '', 'The big day is approaching! Soon it will be decided who will be the next Champion! Train day and night to become that Champion!'});
            
            while 1
                if isButtonPressed('MINUS')
                    close About
                    break
                end
            end
            
        end
        
        if isButtonPressed('B')
            exit=1;
            break
        end
        
        pause(0.000001)
        
    end
    
    disconnectWiimote;
    
    if exit==1
        clear all
        close all
        break
    end
    
    while 1
        
        win=0;
        lose=0;
        
        if start==1
            BOXING
            start=0;
        elseif exit==1;
            close all
            clc
            break
        end
        
        pause(0.000001);
        
        
    end
    
end