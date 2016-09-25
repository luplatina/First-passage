function intY = intFFR(X,F0,Ldomain)
%intFFL integrate the -F/kBT function in the domain of [x L1+L2]e-9
%L=L1+L2;L1 is the free base domain; L2 is the hairpin base domain;
%for left pass caculation single strand part is on the right side

kBT=0.026*1.6e-19;
xx=(0:0.01:Ldomain)*1e-9;% here we define the domain
LX=length(xx);
deltax=xx(2)-xx(1);
F_es=-F0*17e-12*ones(1,LX);%eletric driving force would be expect at the vestibue region

for i=1:LX-1
U_es(LX-i)=sum(F_es((LX-i):LX))*deltax/kBT;
end
U_es(LX)=U_es(LX-1);
intX=ceil(X*100+0.01); %if only want to plot curves +0.01 is preferable.
for i=1:length(intX)
    intY(i)=U_es(intX(i));
end


