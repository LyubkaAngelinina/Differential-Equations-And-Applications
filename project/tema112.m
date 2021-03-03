function project
clc 
%необходимите ни параметри
a=sqrt(6/5);
L=7;
tmax=10;

x=linspace(0,L); 
t=linspace(0,tmax);

%дефинираме функцията фи
function y=phi(x)
for i=1:length(x)
y(i)=0;
end
end

%дефинираме функцията пси
function y=psi(x)
for i=1:length(x)
if x(i)>=4 && x(i)<=6
y(i)=6*((log((x(i)^2)-10*x(i)+25)-1)^3);
else
y(i)=0;
end
end
end

%дефинираме функцията u(x,t)
function y=u(x,t)
y=0;

%55-та частична сума на реда за u(x,t)
for k=0:54
Xk=sin(k*pi*x/L);

Ak=2*trapz(x,phi(x).*Xk)/L;
Bk=2*trapz(x,psi(x).*Xk)/L*(a*pi*k/L);

Tk=Ak*cos((k*a*pi*t)/L)+Bk*sin((k*a*pi*t)/L);

y=y+Tk*Xk; 
end

end

%графики на анимацията 
for n=1:length(t)

%2D plot
plot(x,u(x,t(n)),'r', 'LineWidth', 2);

axis([0,L,-3,3]) 

%създава анимация от текущите оси на екрана
getframe;
end

%разделя текущата фигура на 3x1 решетки и създава оси в позиция 1

subplot(3,1,1)
plot(x,u(x,0),'r','LineWidth',2)
title('При t=0')
grid on
hold off 

subplot(3,1,2)
plot(x,u(x,5),'r','LineWidth',2)
title('При t=5')
grid on
hold off

subplot(3,1,3)
plot(x,u(x,tmax),'r','LineWidth',2)
title('При t=10')
grid on
hold off

end