%Init

pkg load control

clear

clc
tol=1e-10;

%% System
%
A = [0 0 1 0; 0 0 0 1; 0 80.3 -45.8 -0.930; 0 122 -44.1 -1.4]

B = [0; 0; 83.4; 80.3]

C = [ 80.3 -83.4 0 0]

ctr= [B A*B (A*A)*B (A*A*A)*B]

disp('Is controllable?')
rankCtrb=rank(ctr)

disp(' ')
disp('First Diff  ds = CAx + CBu')

cb = C*B
ca = C*A

disp('CB = 0')

disp(' ')
disp('Define M1 = CA  ; C, s.t. Y = M1 x')

M1 = [ca; C ]

disp(' ')
disp('Second Diff = M1 A x + M1 B u')

m1a = M1 * A
m1b = M1 * B

disp(' ')
disp('Define M2 = M1Bp M1A  ; C, s.t. J2 Y2 = M2 x')
M2 = [m1a ; C]

disp(' ')
disp('Second Diff = M2 A x + M2 B u')

m2a = M2 * A
m2b = M2 * B

nm2b = [0 1 0;0 0 1; 0 1 1];

nm2b*m2b

M3 = [nm2b*m2a ; C]

m3a = M3*A
m3b = M3*B

%
%disp(' ')
%disp('Third Diff = C A^3 x + C A^2 B u')
%
%ca2b = ca2*B
%ca3 = ca2*A
%
%M = [C ; ca ; ca2]
