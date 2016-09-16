function w= initPR(Ldomain,xa)
%for dave's lockin exp calculation,give the initial position probability
%for left pass caculation single strand part is on the right side
%L=L1+L2;L1 is the free base domain; L2 is the hairpin base domain;
a0=1e-9;
x0=linspace(0,Ldomain,100*(Ldomain)+1);
w0=sqrt(2*pi*0.007*a0)*exp(-(x0*a0-xa*a0).^2/2/(0.007*a0)^2);
%plot(x0,w0);
w=w0(1:100*Ldomain);
end

