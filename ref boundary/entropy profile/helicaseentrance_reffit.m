function taux=helicaseentrance_reffit(F_e0,Diff,Ldomain)
eV=1.6e-19;
Dopen=2.97e-10/Diff; %unite is m^2/s
kBT=0.026*eV;
xx = linspace(0,Ldomain,100*Ldomain+1)*10^-9;
LX=length(xx);
deltax=xx(2)-xx(1);
F_e=-F_e0*4.7e-12*ones(1,LX);%eletric driving force would be expect at the vestibue region
for i=1:LX-1
U_e(LX-i)=sum(F_e((LX-i):LX))*deltax/kBT;%right end the potentional is 0;
end
Barx1=(Ldomain-1.5)*1e-9; U_s2=1*(xx-Barx1)/(1.5e-9).*(xx>Barx1);
Barx2=1.5e-9;
U_s1=1*(xx-Barx2)/(1.5e-9).*(xx<Barx2);
U_all=U_e-U_s2(1:LX-1)+U_s1(1:LX-1);U_all(LX)=U_all(LX-1);U_all=U_all-U_all(LX);
%plot(xx,U_all);pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% condtional first passage probability %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EXPphi1=exp(U_all);
pi_R=ones(1,length(xx));
pi_L=zeros(1,length(xx));
%%
%%%%conditional first passage time%%%%%%%%%%%
EXPphi2=1./EXPphi1;%EXPphi(Uh0,Fa0);
for i=1:LX
intEXPphiR2(i)=sum(EXPphi2(1:i)*deltax);
end
for i=1:LX
tauR(i)=sum(EXPphi1(i:LX).*intEXPphiR2(i:LX)*deltax)/Dopen;
end

flag0=find(xx>2*0.34e-9,1);
taux=tauR(flag0)*1000;
end

