%Init
clear

clc

%% System
%
A = [0 0 1 0; 0 0 0 1; 0 80.3 -45.8 -0.930; 0 122 -44.1 -1.4]

B = [0; 0; 83.4; 80.3]

C = [ 2 3 9 0; 1 -7 0 5]

ctr= [B A*B (A*A)*B (A*A*A)*B];

disp('Is controllable?')
rankCtrb=rank(ctr)

disp(' ')
disp('First Diff  ds = CAx + CBu')

cb = C*B
ca = C*A

ncb = [-cb(2) cb(1)]

ncb*cb
disp('CB = 0')

disp(' ')
disp('Define M1 = nCB CA  ; C, s.t. Y = M1 x')

M1 = [ ncb*ca; C ]

disp(' ')
disp('Second Diff = M1 A x + M1 B u')

m1a = M1 * A
m1b = M1 * B

nm1b = [ -(m1b(2) + m1b(3)) m1b(1) m1b(1)]

nm1b*m1b
disp(' ')
disp('(M1 B)^perp M1A = 0')

disp(' ')
disp('Define M2 = M1Bp M1A  ; C, s.t. J2 Y2 = M2 x')
M2 = [nm1b*m1a ; C]

disp(' ')
disp('Second Diff = M2 A x + M2 B u')

m2a = M2 * A
m2b = M2 * B

nm2b = [0 5 7]


M3 = [nm2b*m2a ; C]

%
%disp(' ')
%disp('Third Diff = C A^3 x + C A^2 B u')
%
%ca2b = ca2*B
%ca3 = ca2*A
%
%M = [C ; ca ; ca2]
