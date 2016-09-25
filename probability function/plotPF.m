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

