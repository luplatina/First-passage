function cvector = cfun( X,F0,Ldomain,Diff)
%exp[phi]
cvector=exp(-intFFR(X,F0,Ldomain,Diff));
end

