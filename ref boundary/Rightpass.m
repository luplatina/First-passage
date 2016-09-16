function [u p tlist]=Rightpass(b,D0,F0,U1,Barx0,Ldomain)
%LEFTPASS2 Summary of this function goes here
%   Detailed explanation goes here
diff=2.97e-10/D0*(Ldomain)^2;
domain=(1e-9)*(Ldomain);
strd=num2str(diff);
strf=num2str(F0);
stru=num2str(U1);
strdom=num2str(domain);
strL1=num2str(Barx0);
strL2=num2str(Ldomain);
[p,e,t] = initmesh('prob1g');
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);
%[p,e,t] = refinemesh('prob1g',p,e,t);
d=['exp(-intFFR(x,',strf,',',stru,',',strL1,',',strL2,'))/',strd,'*',strdom,'^2'];% smaller diffusion constant give longer pass time
c=['exp(-intFFR(x,',strf,',',stru,',',strL1,',',strL2,'))'];
a=0;
f=0;
%tlist=[0:1e-5:20e-3];
tlist=[0:10e-5:3e-3];
u0=['100000*exp(-abs(',strL2,'-x)*100000)'];%this is the starting time defination, boundary setting is in the drawgeom; 
u = parabolic(u0, tlist, b,p,e,t,c,a,f,d);% the pde parabolic format equation;
%u give the time probability function based on (x,t)(Nmesh,100timepoint)
end

