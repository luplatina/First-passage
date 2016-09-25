function [y1b, xdomain]=Time_evolution(uL,pL,tlist,Ldomain)
%EVOLUTIONTEST Summary of this function goes here
%   Detailed explanation goes here
%[u1a p]=Rightpass( b,diff,drivf,U1,time);
%[u p]=Leftpass(b,diff,drivf,U1,Tlife,Barx0,Ldomain);
TL=length(tlist);

xL=(0:0.01:Ldomain);
for i=1:length(xL)
site(i).dt=find(pL(1,:)>(xL(i))&pL(1,:)<=(xL(i)+0.01));
end
for i=1:TL
[x1a(i,:) y1a(i,:)] = plotPF(abs(uL),i,Ldomain,site);
end
Ny=length(x1a(1,:));
xdomain=x1a(1,:);
for i=1:TL
    y1b(i,:)=y1a(i,:)/trapz(x1a(1,:),y1a(i,:));
    if rem(i,4)==1        
        %plot(x1a(i,:),y1b(i,:)); hold on;
        plot3(x1a(i,1:500),tlist(i)*ones(1,500)*1e6, y1b(i,1:500),'g'); hold on;
        %semilogy(x1a(i,:),y1a(i,:)); hold on;
        pause(0.1);
    end
end
hold off;
end

