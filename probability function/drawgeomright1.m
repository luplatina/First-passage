function drawgeomright1(Ldomain,q)
strq=num2str(q);
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
set(ax,'DataAspectRatio',[1.5 1 1]);
set(ax,'PlotBoxAspectRatio',[1 1 1]);
set(ax,'XLim',[-2 22]);
set(ax,'YLim',[-1 1]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');
pdetool('gridon','on');

% Geometry description:
pderect([0 Ldomain 0.01 -0.01],'R1');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','R1')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(4,'neu',1,strq ,'0')%q value need to be specified first;
pdesetbd(3,'dir',1,'0','0')
%pdesetbd(2,'neu',1,'0','0')% very lazy way to set the right boundary
pdesetbd(2,'dir',1,'1','0')
pdesetbd(1,'dir',1,'0','0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
%fid=wgeom(g,'prob1g');

