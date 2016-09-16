function q = qfun( F0 )
kBT=0.026*1.6e-19;
F_e=-F0*4.7e-12;%4.7e-12 is the force value for 0.1e0/0.34nm*0.1V;
cvector = cfun( 0,F0,0,1,14*0.5,2.97e-10/4.25);
q=cvector*F_e/kBT*1e-9;
end

