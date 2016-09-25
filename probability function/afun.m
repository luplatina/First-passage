function avector = afun(X,F0,Ldomain,Diff)
%afun=Cfun*exp(-intFFR(x,F0,U1,Barx0,Ldomain))
%due to dx has been normalized to 1nm equal 1, all the parameter outside
%the exp has to be normalized the same way.
a=1e-9;%1nm
kBT=0.026*1.6e-19;

xx=(0:0.01:Ldomain)*a;% here we define the domain; standard unit
LX=length(xx);
deltax=xx(2)-xx(1);
F_es=-F0*4.7e-12*ones(1,LX);%eletric driving force would be expect at the vestibue region

gamma=kBT/Diff;%still standard unit;supposed to be vector, but right now scalar is OK;
F_esdgamma=F_es/gamma;
Diffv=Diff*ones(1,LX);
Cfun=[diff(F_esdgamma)/deltax,0]+[diff(diff(Diffv))/deltax/deltax,0,0];
intX=ceil(X*100+0.01); %if only want to plot curves +0.01 is preferable.
for i=1:length(intX)
    CfunY(i)=Cfun(intX(i));
end
avector=CfunY.*exp(-intFFR(X,F0,Ldomain,Diff))/(1e18);%unit should be 1/sec
end

