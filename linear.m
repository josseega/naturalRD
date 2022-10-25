%System
pkg load control

graphics_toolkit ("qt")

clear
clc
close all

%% Parameters


%

A = [0 0 1 0; 0 0 0 1; 0 80.3 -45.8 -0.930; 0 122 -44.1 -1.4];

B = [0; 0; 83.4; 80.3];


a = poly(A);

Q = [a(4) a(3) a(2) a(1); a(3) a(2) a(1) 0; a(2) a(1) 0 0; a(1) 0 0 0];

ctr= [B A*B (A*A)*B (A*A*A)*B];

T= inv(ctr*Q)

At= T*A*inv(T)

Bt= T*B

At= cleanMatrix(At,1e-10)
Bt= cleanMatrix(Bt,1e-10)

P = [-3 -10 -7 -5];

K= place(At,Bt,P)

s = @(t,x) T*x;

u = @(t,x) -K*s(t,x);

%u = @(t,x) -10*sign(sigma(t,x)) - 3*sign(Dsigma(t,x)); 

F = @(t,x) A*x + B*u(t,x);
%%
%simulation parameters
t0 = 0;
st = 1e-3;
tfinal = 10;

y0 = [0.1 0.1 0.2 0]';

%solve
% madqe it to solve yp = F(t,y)
% with ic y(t0) = y
y = y0;
yout = y;


tauOut= u(t0,y0);

for t = t0: st: tfinal-st
    %% oila
        s = F(t,y);
        y = y + st*s;

        tauOut= [tauOut u(t,y)];
       % sigmaout= [sigmaout sigma(t,y)];
       % Dsigmaout= [Dsigmaout Dsigma(t,y)];
        yout = [yout y];
end

x = yout;

runTime = cputime

%% Plotting

t = (0:st:tfinal)';

size(x)

fig1=figure(1)
%set(gca,'FontSize',18)
%set(gcf, 'Color', 'w');

hold on

plot(t,x(1,:))
plot(t,x(2,:))
plot(t,x(3,:))
plot(t,x(4,:))

legend('\alpha','\alpha vel','\theta','\theta vel','location','southeast','fontsize',15)
hold off

%fig2= figure(2);
%
%hold on
%plot(Dsigmaout(1,1),sigmaout(1,1),'Color','r','*')
%plot(Dsigmaout,sigmaout)
%
%hold off

fig3= figure(3);

plot(t,tauOut)
figTime = cputime - runTime



