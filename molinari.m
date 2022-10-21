%Init
clear
clc

%
%
%syms a b real

A = [0 0 1 0; 0 0 0 1; 0 80.3 -45.8 -0.930; 0 122 -44.1 -1.4];

B = [0; 0; 83.4; 80.3];

C = [ 3 10 0 0];

%
cb = C*B

ca = C*A

disp('Second Diff')

M1 = [ca; C]

m1b=M1*B


