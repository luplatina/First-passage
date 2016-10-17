# First-passage-problem-numerical-solver
use Matlab PDE toolbox to solve First passage problem numerically.
##INTRODUCTION
In general, a first passage time is, in a stochastic system, the time taken for a state variable to reach a certain value. The way I try to understand it is: A time-dependent stochastic process can be discribed by a probablity function. And the flux of such probablity function at certain boundary can be modeled as a First passage time problem. I try to acheive a model that can predict a random walker's probablity to reach certain position and probablity flux to pass certain boundary at a given time, with considering walker's own diffusion capability and external field. This model has been successfully applied in my study of [DNA thermal motion in nanopore](http://www.sciencedirect.com/science/article/pii/S0006349515008541), published on Biophysical Journal 2015. It solves a fundamental problem about nanopore sequencing accuracy limited by DNA position fluctuation, which has challenged the nanopore sequencing community for years.  This publication was highlighted as [“NEW and NOTABLE”](http://www.cell.com/biophysj/abstract/S0006-3495(15)01006-1) research in 2015 Biophysical Journal.

##EXPLANATION OF FILES
This code implement the first passage calculation by solving the Smoluchowski equation in matlab PDE toolbox.
The pobability function and probablity flux function are the most useful output parameters from this model.
Detail instruction and relevant mathematic derivation can be found in the file "instruction of First passage calculation in matlab.pdf"

* In the probability flux function folder:

drawgeom_ref.m, prob1g.m are code to Draw the PDE geometry and design boundary condition based on the “PDE tool”.

intFFR is a function associating the calculation of external pontential.

Rightpass.m is the code to calculate the probability flux function depend on the time and initial position of random walker.

probablityflux_xa generate the escape time probability/first passage time probability.

* In the probability flux function folder:

drawgeom_ref.m, prob1g.m are code to Draw the PDE geometry and design boundary condition based on the “PDE tool”.

intFFR is a function associating the calculation of external pontential.

afun.m, cfun.m, dfun.m, qfun are functions associating the boundary condition calculation.

Rightpass.m is the code to calculate the probability function depend on the time and initial position of random walker.

Time_evolution.m plots the time-evolving probability distribution. 

##EXAMPLE

For example, the probability package can plot the time evolution of a probability function with an external force field pulling towards a reflecting boundary.

General procedure:

1.Draw the PDE geometry and design boundary condition based on the “PDE tool”. 

`>>drawgeomright1(Ldomain, qfun(force)); %default value: Ldomain=7;walk domain; force=1.8;the potential profile;`

2.Output the boundary parameter from the PDE toolbox to get the parameter ‘b’ and ‘g’. 

First, GUI-->boundary-->export decomposed geometry, boundary condition. 

Then,

`>>fid = wgeom(g, 'prob1g'); #save the geometry file for PDE solver`

3.Build and solve the PDE

set the diffusion constant (Diff), Duration to observe the evolution process(Tdomain)

`>>[u p tlist]=Rightpass(b,Diff,force,Ldomain,Tdomain); %default value:Diff=6;Tdomain=2e-8;`

4.Plot the probability evolution curves:

`>>[y1b, xdomain]=Time_evolution(u,p,tlist,Tdomain);`

![probability](https://cloud.githubusercontent.com/assets/19654472/18856826/6bd14530-842c-11e6-9b11-b6c83643ece0.png)

And the probability flux package can predict the first passage time distribution for a random walker escaping from an energy well. Usually it should be exponential shape. 

General procedure:

1.Draw the PDE geometry and design boundary condition based on the “PDE tool”,   

`>>drawgeom_ref(Ldomain)  %default value: Ldomain=7;`

2.Output the boundary parameter from the PDE toolbox to get the parameter ‘b’ and ‘g’. 

First, GUI-->boundary-->export decomposed geometry, boundary condition. 

Then,

`>>fid = wgeom(g, 'prob1g'); #save the geometry file for PDE solver`

3.Build and solve the PDE. 

set the diffusion constant (Diff), energy well for escape (force), Duration to observe the escape process(Tau)

`>>[u p tlist]=Rightpass(b,Diff,force,Ldomain,Tau); %default value:Diff=6;force=0.4;Tau=3e-3;`

u is the probability flux function depend on the time(tlist) and initial position of random walker(p); 

4.Plot the escape time distribution.

`>> yprob=probabilityflux_xa(p,u,tlist,Ldomain, xinit); %default value: xinit=1; assume an initial position for the random walker`

`>>plot(tlist,yprob); %escape time probability/first passage time probability;`

![probability_flux](https://cloud.githubusercontent.com/assets/19654472/18859488/86bdcf2e-8442-11e6-82a9-b277a7686a57.png)
