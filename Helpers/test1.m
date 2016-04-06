axis equal
axis([0 100 0 100])
hold on

ball=rectangle('Position', [0 47.5 5 5], 'Curvature', [1 1], 'FaceColor', 'g');

x=0;
increase=1.1;
x0=0;
increment=0.108;

for t=1:1:30
    
    x=x+increase;
    x0=x0+increment;
    y=exp(x0);
    set(ball, 'Position', [x y 5 5])
    pause(0.02)
    
end

for t=1:1:30
    
    x=x-increase;
    x0=x0-increment;
    y=exp(x0);
    set(ball, 'Position', [x y 5 5])
    pause(0.02)
    
end