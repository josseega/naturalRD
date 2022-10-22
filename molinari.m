%Init
clear

clc

%% System
%
A = [0 0 1 0; 0 0 0 1; 0 80.3 -45.8 -0.930; 0 122 -44.1 -1.4]

B = [0; 0; 83.4; 80.3]

C = [ 80.3 -83.4 8 3]

ctr= [B A*B (A*A)*B (A*A*A)*B];

disp('Is controllable?')
rankCtrb=rank(ctr)

disp(' ')
disp('First Diff  ds = CAx + CBu')

cb = C*B
ca = C*A

disp('CB = 0')

disp(' ')
disp('Second Diff = CA^2 x + CAB u')

cab = ca*B
ca2 = ca*A

disp('CAB = 0')

disp(' ')
disp('Third Diff = C A^3 x + C A^2 B u')

ca2b = ca2*B
ca3 = ca2*A

M = [C ; ca ; ca2]
