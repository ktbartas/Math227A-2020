clear; close all; clc;
syms y r ;
eqn1= 0 ==(5-y)*(y^2) +1 -r*y ;
eqn2= 0== 10*y -3*y^2 -r;
[s1,s2]= vpasolve([eqn1 eqn2],[r y])


hold on
scatter(s1,s2)
text(s1(1)-2.8,s2(1)+.5,'(4.25,0.5)')
text(s1(2)+.3,s2(2)+.5,'(-4.66,-.414)')
text(s1(3)+.3,s2(3)+.5,'(6.66,2.41)')
Ylin = children(vpasolve(eqn1,y));
zlin = Ylin(1)
ezplot(zlin,[-10,10])
xlabel('parameter r') 
ylabel('equilibria') 
title('Bifurcation plot for Math227A hw#2, problem 6')

hold off
