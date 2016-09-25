function yprob = probabilityflux_xa(p,u,tlist,Ldomain,xa)
%probabilityflux_xa aims to obtain the probabilityflux at specific inital
%position xa;
% for the common escape process from a energy well, probabilityflux_xa should give 
%an probablity distribution(yprob1) on time axis(xtime1) with "exponential" shape.
% for a random walker start walking at xa, default xa value is 1nm for
% nanopore exp case
%p is the mesh position[x,y], x=p(1,:); y=p(2,:);
%u(x,t) is the probability flux function depend on starting position x and time t;
%afte FEC, p and u need to be sorted according the x position to generate
%the final probablity curves;
u=abs(u);%u is the probability flux f(x0,t)
TL=length(tlist);
%%%%%%%%%%%sorting p and u%%%%%%%%%%%%%%%%%%%%
gridN=100;% final figure 100 points is enough
%xL=(0:0.01:Ldomain);
xL=linspace(0,Ldomain,gridN);
for i=1:length(xL)-1
x_site(i).dt=find(p(1,:)>(xL(i))&p(1,:)<=(xL(i+1)));
end
for i=1:TL %plot time dependence
    %i is the time series
    y(i,:) = plotPF(u,i,x_site);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%y is sorted probability
yprob=y(:,find(xL>=xa,1,'first'));% give the index of x0 in the array of y; 
end

function y = plotPF(u,t_N,x_site)
%plotPF give the probability flux at each moment, trans 2D to 1D 
%  p is the mesh output from the PED toolbox
%  %u(x,t) is the probability flux function depend on starting position x and time t;
%  N is the number of time point.
%  x_site(i).dt give the index of mesh point within certain position box[x(i), x(i+1)].
for i=1:length(x_site)
y(i)=mean(u(x_site(i).dt,t_N));
end
awk=find(isnan(y));
if ~isempty(awk)
    if rem(N,10)==0 disp('NaN points might bother...'); end
    %if it happenned that mean the mesh is too sparse compare to xL
    y(awk)=0;
end
end


