function [ mdataboot, sdataboot ] = Boottrap( data )
%BOOTTRAP Summary of this function goes here
%   Detailed explanation goes here

nboot = 1000;
mdboot = zeros(1,nboot);
for i = 1:nboot
newdata = data(ceil(rand(size(data))*length(data)));
mdboot(i) = mean(newdata);
end
[mdataboot, sdataboot] = normfit(mdboot);
end

