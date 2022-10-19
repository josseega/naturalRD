%System

graphics_toolkit ("qt")

clear
clc
close all

%% Parameters

a=2;
b=10;
hal=2;
hth=3;

%
f_1 = @(t,x) x(2); f_2 = @(t,x) -a*x(1);

g_1 = @(t,x) x(4); g_2 = @(t,x) b*x(3);
f = @(t,x) [f_1(t,x) ; f_2(t,x); g_1(t,x) ; g_2(t,x)] ;


h_1 =@(t,x) 0; h_2 =@(t,x) hal;  h_3 = @(t,x) 0; h_4 = @(t,x) hth;

h = @(t,x) [h_1(t,x) h_2(t,x) h_3(t,x) h_4(t,x)]';

sigma= @(t,x) x(1) - (hal/hth)*x(3);

Dsigma= @(t,x) x(2) - (hal/hth)*x(4);

u = @(t,x) 0;

%u = @(t,x) -10*sign(sigma(t,x)) - 3*sign(Dsigma(t,x)); 

F = @(t,x) f(t,x)+ h(t,x)*u(t,x);
%%
%simulation parameters
t0 = 0;
st = 1e-3;
tfinal = 1;

y0 = [1 5 -1 3]';

%solve
% madqe it to solve yp = F(t,y)
% with ic y(t0) = y
y = y0;
yout = y;


sigmaout = sigma(t0,y0);
Dsigmaout = Dsigma(t0,y0);

tauOut= u(t0,y0);

for t = t0: st: tfinal-st
    %% oila
        s = F(t,y);
        y = y + st*s;

        tauOut= [tauOut u(t,y)];
        sigmaout= [sigmaout sigma(t,y)];
        Dsigmaout= [Dsigmaout Dsigma(t,y)];
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

fig2= figure(2);

hold on
plot(Dsigmaout(1,1),sigmaout(1,1),'Color','r','*')
plot(Dsigmaout,sigmaout)

hold off

fig3= figure(3);

plot(t,tauOut)
figTime = cputime - runTime



