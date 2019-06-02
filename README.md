Parametric and non-parametric classification of MNIST dataset.

### Parametric gaussian likelihood estimation
Estimating the maximum likelihood parameter of gaussian model on given dataset. The implementation is in gauss-likelihood.m.

### Result
From the result below (row represents the correct answer and the column represents the estimated category) gives an accurary of **89.9%**.

```
> octave gauss-likelihood.m
classify_res =

   199     0     0     0     1     0     0     0     0     0
     0   169     8     8     1     2     4     8     0     0
     0     0   182     1     5     0     2     8     1     1
     2     2     0   182     0     1     0     3    10     0
     0     0    21     4   162     1     0     4     4     4
     1     2     0     1     5   185     0     3     0     3
     2     0     1     5     1     0   181     0     9     1
     0     1    16     6     6     0     1   164     3     3
     1     0     0     8     0     0     7     2   182     0
     0     0     3     0     0     4     0     1     0   192
```

### Non-parametric k-Nearest Neighbor method
Classify MNIST dataset by k-Nearest Neighbor method. Determined the best k by cross-validation (implementation in crossvalidation.m). As shown below, I used k=1 as it gave the best result in cross validation, which means k=1 gives the minimum classification error.

```
> octave crossvalidation.m
max_value =  0.96600
index =  1
```

### Result
From the result below (row represents the correct answer and the column represents the estimated category) gives an accurary of **96.6%**.

```
> octave nnc.m
res_mat =

   200     0     0     0     0     0     0     0     0     0
     0   193     1     0     0     0     1     4     1     0
     0     0   195     0     3     0     0     1     1     0
     0     0     0   191     1     2     0     0     6     0
     0     3     4     0   187     0     1     1     2     2
     0     2     0     0     2   195     0     0     0     1
     0     0     1     2     0     0   192     2     3     0
     0     1     4     1     3     0     0   186     2     3
     0     0     0     3     0     0     1     1   195     0
     0     1     1     0     0     0     0     0     0   198

accuracy =  0.96600
```
