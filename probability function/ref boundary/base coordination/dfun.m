function dvector = dfun( X,F0,U0,Barx0,Ldomain,Diff)
%exp[phi]/Diff;
a=1e-9;%1nm
kBT=0.026*1.6e-19;
Uh0=U0*kBT;
xx=(0:0.01:Ldomain)*a;% here we define the domain; standard unit
LX=length(xx);
deltax=xx(2)-xx(1);
Diffv=Diff*ones(1,LX);
intX=ceil(X*100+0.01); %if only want to plot curves +0.01 is preferable.
for i=1:length(intX)
    DiffvY(i)=Diffv(intX(i));
end
dvector=exp(-intFFR(X,F0,U0,Barx0,Ldomain,Diff))./DiffvY/(1e18);
end

