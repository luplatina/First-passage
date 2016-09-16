function xflag=distSOP(Fcoe)
%DISTSOP Summary of this function goes here
%   Detailed explanation goes here
x0=(0:0.01:5)*1e-9;
e0=1.6e-19;
kBT=4.16e-21;
V=0.1;%unit is V
a0=0.34e-9;%unit is m
a=0.5e-9;
basecharge=0.37;
F0=Fcoe*V*basecharge*e0/a0;%160mV driving force and 0.12e/base
prob=exp(-x0.*F0/kBT)/trapz(x0*1e9,exp(-x0.*F0/kBT));
x=x0/a;
plot(x,prob/trapz(x,prob));
cdf = cumtrapz(x, prob)/trapz(x, prob);
%disp('How much is the total probability within x<3a0 region under 160mV:');
%cdf(base4)
baseflag=find(cdf>0.99);
xflag=x(baseflag(1)-1);
%plot(x,cdf);
%nm coordination
%base coordination
end

