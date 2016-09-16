function cutoff( Tesc0 )
%CUTOFF Summary of this function goes here
%   Detailed explanation goes here
%1. determine flag1 for 60% events
flag1=0.15+0.5;
Tesca=Tesc0([Tesc0>0.15]);
TotalN=length(Tesca);
while length(Tesca([Tesca<flag1]))/TotalN<0.6
    flag1=flag1+0.5;
end
stepL=ceil((flag1-0.15)/5*10)/10;
%2. 5 points fit
xtimeb=(0.15:stepL:0.15+10*stepL);
Tescb=Tesca([Tesca<0.15+10*stepL]);
ydemob=hist(Tescb,xtimeb)/trapz(xtimeb,hist(Tescb,xtimeb));
errorb=sqrt(hist(Tescb,xtimeb))/trapz(xtimeb,hist(Tescb,xtimeb));
errorbar(xtimeb, ydemob,errorb);hold on;
fitfunk =@(k,esct) log(exp(-esct/k(1))/k(2));
fitfunc =@(k,esct) exp(-esct/k(1))/k(2);
k = nlinfit(xtimeb(1:5), log(ydemob(1:5)), fitfunk, [1 1]);
plot(xtimeb,fitfunc(k,xtimeb),'r');

testx=(0:20*stepL/1000:20*stepL);
testy=1-exp(-testx/k(1));
flag3x=find(testy>0.99,1,'first');
plot(testx(flag3x),fitfunc(k,testx(flag3x)),'or'); hold off;
flag3=testx(find(testy>0.99,1,'first'));



end

