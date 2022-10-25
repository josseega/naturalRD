%Init

pkg load control

clear

clc
tol=1e-10;

%% System
%
A = [0 0 1 0; 0 0 0 1; 0 80.3 -45.8 -0.930; 0 122 -44.1 -1.4]

B = [0; 0; 83.4; 80.3]

G= inv([A*A*A*B A*A*B A*B B]);

Ag = G*A*inv(G)
Ag = cleanMatrix(Ag,tol)
Bg = G*B
Bg = cleanMatrix(Bg,tol)

disp('Is controllable?')
rankCtrb=rank(G)




