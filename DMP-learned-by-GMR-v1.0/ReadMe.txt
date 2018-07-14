DMP LEARNED BY GMR V1.0

Usage:
Unzip the file and run 'demo1' in Matlab.

Reference:
Calinon, S., Li, Z., Alizadeh, T., Tsagarakis, N.G. and Caldwell, D.G. (2012) Statistical dynamical systems for skills acquisition in humanoids. Proc. of the IEEE Intl Conf. on Humanoid Robots (Humanoids).

Demo 1 - Simple example of DMP learning with GMR
 
Simple example of estimating the parameters of a DMP (dynamic movement primitives) through GMR (Gaussian mixture regression).
A DMP is composed of a virtual spring-damper system modulated by a non-linear force. The standard method to train a DMP is to predefine a set of activations functions and estimate a set of force components through a weighted least-squares (WLS) approach. The weighted sum of force components form a non-linear force perturbing the system, by moving it away from the point-to-point linear motion while following a desired trajectory.
GMR is used here to learn the joint distribution between the decay term s (determined by a canonical dynamical system) and the non-linear force variable to estimate.
Replacing WLS with GMR has the following advantages:
It provides a probabilistic formulation of DMP (e.g., to allow the exploitation of correlation and variation information, and to make the DMP approach compatible with other statistical machine learning tools).
It simultaneously learns the non-linear force together with the activation functions. Namely, the Gaussian kernels do not need to be equally spaced in time (or at predefined values of the decay term 's'), and the bandwidths (variance of the Gaussians) are automatically estimated from the data instead of being hand-tuned.
It provides a more accurate approximation of the non-linear perturbing force with local linear models of degree 1 instead of degree 0 (by exploiting the conditional probability properties of Gaussian distributions).

Author:	Sylvain Calinon, 2012
		http://programming-by-demonstration.org/SylvainCalinon
		
This source code is given for free! In exchange, I would be grateful if you cite
the following reference in any academic publication that uses this code or part of it:

@inproceedings{Calinon12Hum,
	author="Calinon, S. and Li, Z. and Alizadeh, T. and Tsagarakis, N. G. and Caldwell, D. G.",
	title="Statistical dynamical systems for skills acquisition in humanoids",
	booktitle="Proc. {IEEE} Intl Conf. on Humanoid Robots ({H}umanoids)",
	year="2012",
	address="Osaka, Japan"
}
