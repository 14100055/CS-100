axis equal
axis([0 100 0 100])
hold on

ball=rectangle('Position', [0 47.5 5 5], 'Curvature', [1 1], 'FaceColor', 'g');
x0=33;
y0=47.5;
v0=26.5;
angle=atand(47.5/33);
g=9.8;
tMax=(2*v0*sind(angle))/g;
dt=0.05;

for t=0.05:dt:tMax/2
    xT=(v0*t*cosd(angle));
    yT=(v0*t*sind(angle))-(g*(t^2)/2);
%     yT1=-yT2;
%     yT=-1/yT2;
%     xT=v0*cosd(angle);
    
    set(ball, 'Position', [xT 47.5-yT 5 5]);
    pause(0.1)
end