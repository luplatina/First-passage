function [u p tlist]=Rightpass(b,D0,F0,Ldomain,Tau)
%LEFTPASS2 Summary of this function goes here
%   Detailed explanation goes here
diff=2.97e-10/D0*(Ldomain)^2;
%2.97e-10m^2/s is D for the 1.5nm diameter sphear;
domain=(1e-9)*(Ldomain);%unit is nm;
strd=num2str(diff);
strf=num2str(F0);
strdom=num2str(domain);
strL2=num2str(Ldomain);
[p,e,t] = initmesh('prob1g');
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);

d=['exp(-intFFR(x,',strf,',',strL2,'))/',strd,'*',strdom,'^2'];
%d=exp(-intFFR(x,F0,Ldomain))/diff*domain^2;
c=['exp(-intFFR(x,',strf,',',strL2,'))'];
%c=exp(-intFFR(x,F0,Ldomain));
a=0;
f=0;
tlist=linspace(0,Tau,500);%time series, unite is sec
%tlist=[0:10e-6:3e-3];%time series, unite is sec
u0=['100000*exp(-abs(',strL2,'-x)*100000)'];%this is the starting time defination, boundary setting is in the drawgeom; 

u = parabolic(u0, tlist, b,p,e,t,c,a,f,d);% the pde parabolic format equation;
%u give the time probability function based on (x,t)(Nmesh,tlist)
end

