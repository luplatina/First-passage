function helicaseentrance_ref(F_e0,Diff,Ldomain)
%
%a0=0.34e-9;%single base length
eV=1.6e-19;
Dopen=2.97e-10/Diff; %unite is m^2/s
kBT=0.026*eV;
xx = linspace(0,Ldomain,100*Ldomain+1)*10^-9;
LX=length(xx);
deltax=xx(2)-xx(1);
F_e=-F_e0*4.7e-12*ones(1,LX);%eletric driving force would be expect at the vestibue region
%Barx=Barx0*1e-9;

for i=1:LX-1
U_e(LX-i)=sum(F_e((LX-i):LX))*deltax/kBT;
end
U_all=U_e;U_all(LX)=U_all(LX-1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% condtional first passage probability%%%%%%
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

%%
subplot(1,2,1);
plot(xx,pi_R,'r','LineWidth',2);
hold on;
plot(xx,pi_L,'g','LineWidth',2);
legend('backwards odds','forwards odds');
ylabel('passage probability')
xlabel('location (m)')
hold off

subplot(1,2,2);
plot(xx,tauR*1000,'r','LineWidth',2);
%hold on;
%plot(xx,tauL*1000,'g','LineWidth',2);
legend('mean backwards \tau');
ylabel('passage time (ms)')
xlabel('location (m)')
hold off


end

