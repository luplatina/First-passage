function [x,y]=prob1g(bs,s)
%PROB1G	Gives geometry data for the prob1g PDE model.
%
%   NE=PROB1G gives the number of boundary segments
%
%   D=PROB1G(BS) gives a matrix with one column for each boundary segment
%   specified in BS.
%   Row 1 contains the start parameter value.
%   Row 2 contains the end parameter value.
%   Row 3 contains the number of the left-hand regions.
%   Row 4 contains the number of the right-hand regions.
%
%   [X,Y]=PROB1G(BS,S) gives coordinates of boundary points. BS specifies the
%   boundary segments and S the corresponding parameter values. BS may be
%   a scalar.

nbs=4;

if nargin==0,
  x=nbs; % number of boundary segments
  return
end

d=[
  0 0 0 0 % start parameter value
  1 1 1 1 % end parameter value
  0 0 0 0 % left hand region
  1 1 1 1 % right hand region
];

bs1=bs(:)';

if find(bs1<1 | bs1>nbs),
  error(message('pde:wgeom:NonExistBoundSeg'))
end

if nargin==1,
  x=d(:,bs1);
  return
end

x=zeros(size(s));
y=zeros(size(s));
[m,n]=size(bs);
if m==1 & n==1,
  bs=bs*ones(size(s)); % expand bs
elseif m~=size(s,1) | n~=size(s,2),
  error(message('pde:wgeom:BsSizeError'));
end

if ~isempty(s),

% boundary segment 1
ii=find(bs==1);
if length(ii)
x(ii)=(12-(0))*(s(ii)-d(1,1))/(d(2,1)-d(1,1))+(0);
y(ii)=(0.01-(0.01))*(s(ii)-d(1,1))/(d(2,1)-d(1,1))+(0.01);
end

% boundary segment 2
ii=find(bs==2);
if length(ii)
x(ii)=(12-(12))*(s(ii)-d(1,2))/(d(2,2)-d(1,2))+(12);
y(ii)=(-0.01-(0.01))*(s(ii)-d(1,2))/(d(2,2)-d(1,2))+(0.01);
end

% boundary segment 3
ii=find(bs==3);
if length(ii)
x(ii)=(0-(12))*(s(ii)-d(1,3))/(d(2,3)-d(1,3))+(12);
y(ii)=(-0.01-(-0.01))*(s(ii)-d(1,3))/(d(2,3)-d(1,3))+(-0.01);
end

% boundary segment 4
ii=find(bs==4);
if length(ii)
x(ii)=(0-(0))*(s(ii)-d(1,4))/(d(2,4)-d(1,4))+(0);
y(ii)=(0.01-(-0.01))*(s(ii)-d(1,4))/(d(2,4)-d(1,4))+(-0.01);
end

end
