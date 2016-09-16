function [xtime yprob]=position_evolution(p,u,tlist,Ldomain,xa)
%plotTP give the escape probabilty depend on time.
%   Detailed explanation goes here
u=abs(u);
TL=length(tlist);
xL=(0:0.01:Ldomain);
for i=1:length(xL)
site(i).dt=find(p(1,:)>(xL(i))&p(1,:)<=(xL(i)+0.01));
end
for i=1:TL %plot time dependence
[x(i,:) y(i,:)] = plotPF(u,i,Ldomain,site);
end
yprob0=y(:,fix(xa*100));
xtime=linspace(0,tlist(end),TL);
yprob=interp1(tlist,yprob0,xtime);
yprob(find(isnan(yprob)))=0;

end


