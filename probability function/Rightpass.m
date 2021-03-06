function [u p tlist]=Rightpass(b,D0,F0,Ldomain,tdomain)
%LEFTPASS2 Summary of this function goes here
%   Detailed explanation goes here
diff0=2.97e-10/D0;%unit is m^2/sec;
strd=num2str(diff0);
strf=num2str(F0);
strL2=num2str(Ldomain);
[p,e,t] = initmesh('prob1g');
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);
[p,e,t] = refinemesh('prob1g',p,e,t);
d=['dfun(x,',strf,',',strL2,',',strd,')'];%['exp(-intFFR(x,',strf,',',stru,',',strL1,',',strL2,'))/',strd,'*',strdom,'^2'];
c=['cfun(x,',strf,',',strL2,',',strd,')'];%['exp(-intFFR(x,',strf,',',stru,',',strL1,',',strL2,'))'];
a=['afun(x,',strf,',',strL2,',',strd,')'];%afun=L^2*Cfun*exp(-intFFR(x,F0,U1,Barx0,Ldomain))
f=0;

%tdomain=2e-8;
initialx=4*0.5;
strL3=num2str(initialx);
tlist=[0:0.01:1]*tdomain;%10usec

u0=['1e2*exp(-abs(',strL3,'-x)*1e2)'];%this is the starting time defination, boundary setting is in the drawgeom; 
u = parabolic(u0,tlist, b,p,e,t,c,a,f,d);% the pde parabolic format equation;
%u give the time probability function based on (x,t)(Nmesh,100timepoint)
end

