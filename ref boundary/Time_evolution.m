function Time_evolution(uL,pL,tlist,Ldomain)
%EVOLUTIONTEST Summary of this function goes here
%   Detailed explanation goes here
%[u1a p]=Rightpass( b,diff,drivf,U1,time);
%[u p]=Leftpass(b,diff,drivf,U1,Tlife,Barx0,Ldomain);
TL=length(tlist);
for i=1:TL
[x1a(i,:) y1a(i,:)] = plotPF(pL,abs(uL),i,Ldomain);
end

for i=1:TL
    %plot3(x1a(i,:),0.01*Tlife*i*ones(1,100*Ldomain),y1a(i,:),'b');hold on;
    %plot3(x1a(i,:),tlist(i)*ones(1,100*Ldomain),y1a(i,:),'b');hold on;
    plot3(x1a(i,1:fix(100*Ldomain/2)),tlist(i)*ones(1,100*Ldomain/2),y1a(i,1:100*Ldomain/2),'b');hold on;
pause(0.1);
end
end

