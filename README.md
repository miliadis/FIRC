## Robust and Low-Rank Representation for Fast Face Identification with Occlusions
by Michael Iliadis, Haohong Wang, Rafael Molina, Aggelos K. Katsaggelos, published on *Transactions on Image Processing, May 21017* and [ArXiv](https://arxiv.org/abs/1605.02266). Details are in [project page](http://users.eecs.northwestern.edu/~mif365/jekyll/content/publications/2015/face_occlusion.html)

### Introduction
The code provides MATLAB implementation of the F-LR-IRNNLS and the F-IRNNLS algorithm which is a fast version of the RRC ([Regularized robust coding for face recognition])(http://ieeexplore.ieee.org/document/6392275/) algorithm (with non-negative representation coefficients - but it's easy to adapt it to L2 or L1 coeff.)

### Usage

#### Download MATLAB code

Clone the repository:

```bash
$ git clone https://github.com/miliadis/FIRC
$ cd ~/FIRC 
```

#### Data

* By default the experiments reproduce the FIRC results on YaleB dataset with 60% occlusion.
* Data of YaleB are provided to reproduce the results of the paper. For more data please reach out.

#### Testing

1. Add to the path the entire "FIRC" folder
2. Run "Main.m"

    ```shell
   Main.m
   ```  
3. Results will be printed for each query face.

##### Run F-LR-IRNNLS vs. F-IRNNLS

1. If you want to run the F-LR-IRNNLS classifier for occlusions set:

    ```shell
   fr.alg = 'f-lr-irc'
   ```  

2. If you want to run the F-IRNNLS which is the fast version of the RRC algorithm from
the "Regularized robust coding for face recognition" paper set fr.alg = 'f-irc'.

    ```shell
   fr.alg = 'f-irc'
   ```  
   Make sure that the settings of the weight function are similar to the ones in RRC.

### Citation

If FIRC is useful for your research, please consider citing:

    @article{Iliadis2017, 
    author={M. Iliadis and H. Wang and R. Molina and A. K. Katsaggelos}, 
    journal={IEEE Transactions on Image Processing}, 
    title={Robust and Low-Rank Representation for Fast Face Identification With Occlusions}, 
    year={2017}, 
    volume={26}, 
    number={5}, 
    pages={2203-2218},
    month={May}}
    
### Questions
Please contact 'miliad@u.northwestern.edu'

