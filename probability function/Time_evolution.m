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
    if rem(i,1)==0         
        plot3(x1a(i,1:500),tlist(i)*ones(1,500)*1e9, y1b(i,1:500),'g'); hold on;
        pause(0.1);
    end
    if rem(i,8)==1   
        plot3(x1a(i,1:500),tlist(i)*ones(1,500)*1e9, y1b(i,1:500),'b','lineWidth',1); hold on;        
        pause(0.1);
    end
end
set(gca,'fontsize', 16);
zlim([0 6]);
xlabel('walk domain (nm)');
ylabel('time (nsec)');
zlabel('probability');
ylim([0 6]);
hold off;
end

function [x1 y] = plotPF(u,N,Ldomain,site)
%PLOT1 give the probability flux at each moment, trans 2D to 1D 
%  p is the mesh output from the PED toolbox
%  u is the probability flux at each moment
%  N is the number of time point.
%  x0 is the position along the x direction
orz=int16((Ldomain)*100);
for i=1:orz
y(i)=mean(u(site(i).dt,N));
end
%x=(0:0.01:Ldomain); 
x=linspace(0,Ldomain,int16(Ldomain*100+1));
x1=x(1:end-1);
%y(1)=0;
y0=y;
x0=x1;
awk=find(isnan(y));
if length(awk)>0
    %disp('NaN points might bother...')
    y0(awk)=[];
    x0(awk)=[];
    y=interp1(x0,y0,x1,'linear');
end
end
