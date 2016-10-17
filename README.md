# First-passage-problem-numerical-solver
use Matlab PDE toolbox to solve First passage problem numerically.
##INTRODUCTION
A time-dependent stochastic process can be modeled as a First passage time problem. The core idea of this model is to predict a random walker's probablity to reach certain position or pass certain boundary at a given time, with considering its own diffusion capability and external field. An important application of this model has solved a fundamental problem about nanopore sequencing accuracy limited by DNA thermal motion, which has challenged the nanopore sequencing community for years.  This paper was highlighted as [“new and notable”](http://www.cell.com/biophysj/abstract/S0006-3495(15)01006-1) research in 2015 Biophysical Journal.

This code implement the first passage calculation by solving the Smoluchowski equation in matlab PDE toolbox.
The pobability function and probablity flux function are the most useful output parameters from this model.
Detail instruction and relevant mathematic derivation can be found in the file "instruction of First passage calculation in matlab.pdf"


##CORE IDEA

##EXPLANATION OF FILES

##EXAMPLE

For example, the probability package can plot the time evolution of a probability function with an external force field pulling towards a reflecting boundary.

![probability](https://cloud.githubusercontent.com/assets/19654472/18856826/6bd14530-842c-11e6-9b11-b6c83643ece0.png)

And the probability flux package can predict the first passage time distribution for a random walker escaping from an energy well. Usually it should be exponential shape.  

![probability_flux](https://cloud.githubusercontent.com/assets/19654472/18859488/86bdcf2e-8442-11e6-82a9-b277a7686a57.png)
