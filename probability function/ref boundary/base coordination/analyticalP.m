function P=analyticalP(F0,D0,Ldomain,tdomain)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

a=1e-9;%1nm
kBT=0.026*1.6e-19;
xx=(0:0.01:Ldomain)*a;%(-Ldomain:0.01:Ldomain)*a;
LX=length(xx);
tx=(0:0.01:1)*1e-3*tdomain;%unit is ms
F_e=F0*4.7e-12*ones(1,LX);
diff0=2.97e-10/D0;
gamma=kBT/diff0;
vel=F_e/gamma;


for i=1:length(tx) 
P(i,:)=(4*pi*diff0*tx(i))^(-0.5)*exp(-(xx-vel*tx(i)-3*0.34*a).^2/4/diff0/tx(i));
end
for i=1:length(tx)
    %plot3(x1a(i,:),0.01*Tlife*i*ones(1,100*Ldomain),y1a(i,:),'b');hold on;
    %plot3(x1a(i,:),tlist(i)*ones(1,100*Ldomain),y1a(i,:),'b');hold on;
    if rem(i,20)==1
        P1(i,:)=P(i,:)/trapz(xx(1,:)*1e9,P(i,:));
    plot3(xx*1e9,tx(i)*ones(1,LX)*1e6,P1(i,:),'r','LineWidth',2);hold on;
    pause(0.1);
    end
end
hold off;

end

