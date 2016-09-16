function cvector = cfun( X,F0,U0,Barx0,Ldomain,Diff)
%exp[phi]
cvector=exp(-intFFR(X,F0,U0,Barx0,Ldomain,Diff));
end

