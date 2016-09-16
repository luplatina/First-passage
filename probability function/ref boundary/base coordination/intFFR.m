function intY = intFFR(X,F0,U0,Barx0,Ldomain,Diff)
%intFFL integrate 2A/B function in the domain of [x L1+L2]e-9
%L=L1+L2;L1 is the free base domain; L2 is the hairpin base domain;
%for left pass caculation single strand part is on the right side
a=1e-9;%1nm
kBT=0.026*1.6e-19;
Uh0=U0*kBT;
xx=(0:0.01:Ldomain)*a;% here we define the domain
LX=length(xx);
deltax=xx(2)-xx(1);
F_e=-F0*4.7e-12*ones(1,LX);%eletric driving force would be expect at the vestibue region
Barx=Barx0*a;%position
F_s=Uh0/Barx*(xx<Barx);
F_es=F_e+F_s;
part2=[2*diff(Diff*ones(1,LX)),0]/deltax/Diff*kBT;% suppose to be zeros for most of time
F_es=F_es+part2;
for i=1:LX-1
U_es(LX-i)=-sum(F_es((LX-i):LX))*deltax/kBT;
end
U_es(LX)=U_es(LX-1);

%plot(xx,U_es); xlabel('x/nm'); ylabel('U/kBT');
intX=ceil(X*100+0.01); %if only want to plot curves +0.01 is preferable.
for i=1:length(intX)
    intY(i)=U_es(intX(i));
end
%subplot(2,1,2);plot(X,intY);xlabel('x/a_0');ylabel('sum(Fdx/k_BT)[x, 2a_0]');


