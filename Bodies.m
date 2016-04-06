function [ PlayerL PlayerR PlayerBody PlayerHead EnemyL EnemyR EnemyBody EnemyHead ] = Bodies( ~ )
%BODIES Bodies of player and enemy
%       Make spheres for heads. Bodies should be cylinders and fists
%       should again be spheres.

%% intialization
rad=10;          %radius of a sphere
[x,y,z]= sphere(50);  %create a sphere
[xc yc zc]=cylinder(1, 20);  %create a cylinder
heightCylin=50;

%% bodies

xPlayer=100+rad.*xc;
yPlayer=65+rad.*yc;
zPlayer=20+heightCylin.*zc;
PlayerBody=surf(xPlayer, yPlayer, zPlayer, 'FaceColor', [0 0 1], 'Edgecolor', 'none');

xEnemy=100+rad.*xc;
yEnemy=135+rad.*yc;
zEnemy=20+heightCylin.*zc;
EnemyBody=surf(xEnemy, yEnemy, zEnemy, 'FaceColor', [1 0 0], 'Edgecolor', 'none');

%% heads

xPlayerHead=100+1.25*rad.*x;
yPlayerHead=65+1.25*rad.*y;
zPlayerHead=80+1.25*rad.*z;
PlayerHead=surf(xPlayerHead, yPlayerHead, zPlayerHead, 'FaceColor', [0 0 1], 'EdgeColor', 'none');

xEnemyHead=100+1.25*rad.*x;
yEnemyHead=135+1.25*rad.*y;
zEnemyHead=80+1.25*rad.*z;
EnemyHead=surf(xEnemyHead, yEnemyHead, zEnemyHead, 'FaceColor', [1 0 0], 'EdgeColor', 'none');

%% fists

xPlayerL=82.5+rad.*x;        %scaling the size of the sphere
yPlayerL=85+rad.*y;        %scaling the size of the sphere
zPlayerL=50+rad.*z;        %scaling the size of the sphere
PlayerL=surf(xPlayerL, yPlayerL, zPlayerL, 'Facecolor', [0 0 1], 'Edgecolor', 'none'); %draws the sphere
PlayerLData=[xPlayerL yPlayerL zPlayerL];

xPlayerR=117.5+rad.*x;        %scaling the size of the sphere
yPlayerR=85+rad.*y;        %scaling the size of the sphere
zPlayerR=50+rad.*z;        %scaling the size of the sphere
PlayerR=surf(xPlayerR, yPlayerR, zPlayerR, 'Facecolor', [0 0 1], 'Edgecolor', 'none'); %draws the sphere
PlayerRData=[xPlayerR yPlayerR zPlayerR];

xEnemyL=117.5+rad.*x;        %scaling the size of the sphere
yEnemyL=115+rad.*y;        %scaling the size of the sphere
zEnemyL=50+rad.*z;        %scaling the size of the sphere
EnemyL=surf(xEnemyL, yEnemyL, zEnemyL, 'Facecolor', [1 0 0], 'Edgecolor', 'none'); %draws the sphere
EnemyLData=[xEnemyL yEnemyL zEnemyL];

xEnemyR=82.5+rad.*x;        %scaling the size of the sphere
yEnemyR=115+rad.*y;        %scaling the size of the sphere
zEnemyR=50+rad.*z;        %scaling the size of the sphere
EnemyR=surf(xEnemyR, yEnemyR, zEnemyR, 'Facecolor', [1 0 0], 'Edgecolor', 'none'); %draws the sphere
EnemyRData=[xEnemyR yEnemyR zEnemyR];

end