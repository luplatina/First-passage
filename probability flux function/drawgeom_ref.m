function drawgeom_ref(Ldomain)
%Ldomain unit is nm for nanopore escape exp; defaut value is 14*0.5
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
set(ax,'DataAspectRatio',[8.2223194748358903 1 32.533333333333353]);
set(ax,'PlotBoxAspectRatio',[1 1 1]);
set(ax,'XLim',[-0.250 0.25+Ldomain]);
set(ax,'YLim',[-0.05 0.05]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');
pdetool('gridon','on');

% Geometry description:
pderect([0 Ldomain 0.01 -0.01],'R1');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','R1')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(4,'neu',1,'0','0')
pdesetbd(3,'dir',1,'0','0')
pdesetbd(2,'dir',1,'1','exp(-t*10e12)*10e12')
pdesetbd(1,'dir',1,'0','0')

% PDE coefficients:
pdeseteq(1,...
'1.0',...
'0.0',...
'10.0',...
'1.0',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1.0 ';...
'0.0 ';...
'10.0';...
'1.0 '])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','1000','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');
