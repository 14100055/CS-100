function [ axisWidth axisLength ] = BoxingRing( )
%BOXINGRING background of boxing ring
%           First made square base. Then four posts were be made by
%           cylinder command. Then used lines to connect them up as ropes.

%% clean-up

clear
close all
clc

%% graph set-up

figure
axis equal
axisWidth=[-10 210];
axisLength=[-10 210];
axisHeight=[0 110];
axis([axisWidth axisLength axisHeight])
hold on

xlabel('X AXIS');
ylabel('Y AXIS');
zlabel('Z AXIS');

%% square base

xbase=[-10 -10 210 210 -10];
ybase=[-10 210 210 -10 -10];
zbase=[0 0 0 0 0];
base=fill3(xbase, ybase, zbase, 'w', 'LineWidth', 2);

%% cylinder posts

rad=7.5;
height=100;
[xCylin yCylin zCylin]=cylinder(1, 25);

% blue corner
xBlue=xCylin*rad;
yBlue=yCylin*rad;
zBlue=zCylin*height;
BlueCorner=surf(xBlue, yBlue, zBlue, 'EdgeColor', 'none', 'FaceColor', 'b');

% adjacent corner1

xAdjac1=xCylin*rad;
yAdjac1=200+yCylin*rad;
zAdjac1=zCylin*height;
Adjac1=surf(xAdjac1, yAdjac1, zAdjac1, 'EdgeColor', 'none', 'FaceColor', 'k');

% red corner

xRed=200+xCylin*rad;
yRed=200+yCylin*rad;
zRed=zCylin*height;
RedCorner=surf(xRed, yRed, zRed, 'EdgeColor', 'none', 'FaceColor', 'r');

% adjacent corner2

xAdjac2=200+xCylin*rad;
yAdjac2=yCylin*rad;
zAdjac2=zCylin*height;
Adjac2=surf(xAdjac2, yAdjac2, zAdjac2, 'EdgeColor', 'none', 'FaceColor', 'k');

% tops of posts

Angles=0:15:360;
xCir1=rad*cosd(Angles);
yCir1=rad*sind(Angles);
zCircle=100+zeros(1,25);
cylinTopBlue=fill3(xCir1, yCir1, zCircle, 'b', 'EdgeColor', 'None');

xCir2=rad*cosd(Angles);
yCir2=200+rad*sind(Angles);
cylinTopA1=fill3(xCir2, yCir2, zCircle, 'k', 'EdgeColor', 'None');

xCir3=200+rad*cosd(Angles);
yCir3=200+rad*sind(Angles);
cylinTopRed=fill3(xCir3, yCir3, zCircle, 'r', 'EdgeColor', 'None');

xCir4=200+rad*cosd(Angles);
yCir4=rad*sind(Angles);
cylinTopA2=fill3(xCir4, yCir4, zCircle, 'k', 'EdgeColor', 'None');

%% ropes for each side

% side 1: from blue corner to adjacent corner1

low1=plot3([0 0], [0 200], [25 25], 'Color', 'k', 'LineWidth', 2);
mid1=plot3([0 0], [0 200], [52.5 52.5], 'Color', 'k', 'LineWidth', 2);
high1=plot3([0 0], [0 200], [80 80], 'Color', 'k', 'LineWidth', 2);
side1=[low1 mid1 high1];

% side 2: from adjacent corner1 to red corner

low2=plot3([0 200], [200 200], [25 25], 'Color', 'k', 'LineWidth', 2);
mid2=plot3([0 200], [200 200], [52.5 52.5], 'Color', 'k', 'LineWidth', 2);
high2=plot3([0 200], [200 200], [80 80], 'Color', 'k', 'LineWidth', 2);
side2=[low2 mid2 high2];

% side 3: from red corner to adjacent corner2

low3=plot3([200 200], [200 0], [25 25], 'Color', 'k', 'LineWidth', 2);
mid3=plot3([200 200], [200 0], [52.5 52.5], 'Color', 'k', 'LineWidth', 2);
high3=plot3([200 200], [200 0], [80 80], 'Color', 'k', 'LineWidth', 2);
side3=[low3 mid3 high3];

% side 4: from adjacent corner2 to blue corner

low4=plot3([200 0], [0 0], [25 25], 'Color', 'k', 'LineWidth', 2);
mid4=plot3([200 0], [0 0], [52.5 52.5], 'Color', 'k', 'LineWidth', 2);
high4=plot3([200 0], [0 0], [80 80], 'Color', 'k', 'LineWidth', 2);
side4=[low4 mid4 high4];

camlight left, lighting flat

end