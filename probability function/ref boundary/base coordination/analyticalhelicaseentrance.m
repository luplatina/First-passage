function analyticalhelicaseentrance(F_e0,Barx0,Diff,Uh0,Ldomain)
%cos shape energy is created in the range  from 0 to beadsize 1. and the driving force is provided acrossing the energy well to the left
% the adjoint Smoluchowski equation is used to calculate the conditional first passage probability and mean time.
%a is the size of the bead, unit is 1.5nm;
%Uh is the depth of the energy well, unit is kBT;
%Fa is the driving force work on one bead displacement. unit is kBT; For
%100mV should be about 2kBT level;
%kBT=1;
%D is the diffusion constant of a bead, in the open space D=3*10^-10m^2/s,
%in the unit of bead^2/s is 1.3*10^8bead^2/s.
%we consider left is the walker's walking direction; and for hairpin
%structure, one left side there is a repulsing potential
%plot(xx,phi(Uh0,Fa0));L=L1+L2L1 is the single strand and L2 is the hairpin
%
%a0=0.34e-9;%single base length
eV=1.6e-19;
Dopen=2.97e-10/Diff; %unite is m^2/s
kBT=0.026*eV;
xx = linspace(0,Ldomain,100*Ldomain+1)*10^-9;
LX=length(xx);
deltax=xx(2)-xx(1);
F_e=-F_e0*4.7e-12*ones(1,LX);%eletric driving force would be expect at the vestibue region
Barx=Barx0*1e-9;
%Uh0=5;
for i=1:LX-1
U_e(LX-i)=sum(F_e((LX-i):LX))*deltax/kBT;
end
U_s=Uh0*(Barx-xx)/Barx.*(xx<Barx);
U_all=U_e+U_s(1:LX-1);
U_all(LX)=U_all(LX-1);
%plot(xx,U_all); pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% condtional first passage probability%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EXPphi1=exp(U_all);
for i=1:LX
intEXPphiR0(i)=sum(EXPphi1(1:i)*deltax);
end
pi_R=intEXPphiR0/intEXPphiR0(LX);


for i=1:LX
intEXPphiL0(i)=sum(EXPphi1(i:LX)*deltax);
end
pi_L=intEXPphiL0/intEXPphiL0(1);
%%
%%%%conditional first passage time%%%%%%%%%%%
EXPphi2=1./EXPphi1;%EXPphi(Uh0,Fa0);
for i=1:LX
    flagR1(i)=sum(EXPphi2(1:i).*pi_R(1:i)/Dopen*deltax);
end
for i=1:LX
    theta_R1(i)=-sum(EXPphi1(1:i).*flagR1(1:i)*deltax);
end
C=sum(EXPphi1(1:LX).*flagR1(1:LX)*deltax)/intEXPphiR0(LX);
for i=1:LX
theta_R2(i)=C*sum(EXPphi1(1:i)*deltax);
end
theta_R=theta_R1+theta_R2;
tauR=theta_R./pi_R;%from theta to pass time.

for i=1:LX
    flagL1(i)=sum(EXPphi2(i:LX).*pi_L(i:LX)/Dopen*deltax);
end
for i=1:LX
    theta_L1(i)=-sum(EXPphi1(i:LX).*flagL1(i:LX)*deltax);
end
C=sum(EXPphi1(1:LX).*flagL1(1:LX)*deltax)/intEXPphiL0(1);
for i=1:LX
theta_L2(i)=C*sum(EXPphi1(i:LX)*deltax);
end
theta_L=theta_L1+theta_L2;
tauL=theta_L./pi_L;%from theta to pass time.


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
hold on;
plot(xx,tauL*1000,'g','LineWidth',2);
%lost=tauL(200)*1000000;
%yy=(0:1:350)*0; x0=L2; yy(101+x0:201+x0)=fliplr(drifty);TransT=sum(tauL.*yy)/sum(yy)*1000000;
legend('mean backwards \tau','mean forwards \tau');
ylabel('passage time (ms)')
xlabel('location (m)')
hold off


end

