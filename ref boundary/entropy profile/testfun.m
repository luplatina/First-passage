function Tesc = testfun( x,voltage )
%TESTFUN Summary of this function goes here
%   Detailed explanation goes here
%calculate the variance of each voltage
for i=1:length(voltage)
Tesc(i) = helicaseentrance_reffit(x(1)*voltage(i)/100,x(2),0.50*14)+0.1;%27mer is 27-13=14base,34-13=21
end
%fitfunc =@(x,voltagex) testfun(x,voltagex);
%fitfunc(x0,voltage(1:6))
%fitx = nlinfit(voltage(1:6), Tesc(1:6), fitfunc, x0);
%[fitx, R,J, CovB]=nlinfit(voltage(1:6), Tesc(1:6), fitfunc, x0, 'Weights',sdataboot);
%plot(voltage(1:6),Tesc(1:6),'or');
%hold on;
%plot(voltage(1:6),fitfunc(fitx,voltage(1:6)));
%[ mdataboot(1), sdataboot(1) ] = Boottrap(Tesc15mV1);
%[ mdataboot(2), sdataboot(2) ] = Boottrap(Tesc18mV1);
%[ mdataboot(3), sdataboot(3) ] = Boottrap(Tesc21mV1);
%[ mdataboot(4), sdataboot(4) ] = Boottrap(Tesc24mV1);
%[ mdataboot(5), sdataboot(5) ] = Boottrap(Tesc27mV1);
%[ mdataboot(6), sdataboot(6) ] = Boottrap(Tesc30mV1);
%[fitx, R,J, CovB]=nlinfit(voltage(1:6), Tesc0(1:6), fitfunc, x0, 'Weights',sdataboot);
%sqrt(diag(CovB))
