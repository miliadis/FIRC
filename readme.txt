Robust and Low-Rank Representation for Fast Face Identification with Occlusions

This is the code to reproduce the results of the paper 
"Robust and Low-Rank Representation for Fast Face Identification with Occlusions"
published on Arxiv

The code provides an implementation of the F-LR-IRNNLS and the F-IRNNLS algorithm 
which is a fast version of the RRC ("Regularized robust coding for face recognition") algorithm 
(with non-negative representation coefficients - but it's easy to adapt it to L2 or L1 coeff.)

---------------------------------------------------------------------------
Usage:

1) add to the path the entire "FIRC" folder
2) run "Main.m"

---------------------------------------------------------------------------
More info:

By default the experiments reproduce the FIRC results on YaleB dataset with 60% occlusion.
Data of YaleB are provided to reproduce the results of the paper.

---------------------------------------------------------------------------

1. If you want to run the F-LR-IRNNLS classifier for occlusions set fr.alg = 'f-lr-irc'

2. If you want to run the F-IRNNLS which is the fast version of the RRC algorithm from
the "Regularized robust coding for face recognition" paper set fr.alg = 'f-irc'.
Make sure that the settings of the weight function are similar to the ones in RRC.

---------------------------------------------------------------------------

BSD Licence. 