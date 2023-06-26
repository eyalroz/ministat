# ministat: A small command-line statistics utility

<sub>Originally by Poul-Henning Kamp</sub>

This small utility reads sequences of numbers from input files, calculates several commonly-used statistics for each sequence, and plots these statistics in ASCII-art.

It is intended for use in command-line scripts, as an alternative to heavier and more full-fledged statistics packages.

## Example usage

Prepare your data into two files, one number per line. Then, invoke:
```
./ministat data_before data_after
```
and see what it says.

You need at least three data points in each data set, but the more you have - the more statistically valid your result generally gets.

Here are two typical outputs:

```
x _1
+ _2
+--------------------------------------------------------------------------+
|x            +    x+      x            x   x             +           ++   |
|        |_________|______AM_______________|__A___________M_______________||
+--------------------------------------------------------------------------+
    N           Min           Max        Median           Avg        Stddev
x   5         36060         36138         36107       36105.6     31.165686
+   5         36084         36187         36163       36142.6     49.952978
No difference proven at 95.0% confidence
```

Here nothing can be concluded from the numbers.  It _may_ be possible to
prove something if many more measurements are made, but with only five
measurements, nothing is proven.

```
x _1
+ _2
+--------------------------------------------------------------------------+
|                                                               +          |
|                               x                               +         +|
|x                    x         x          x                    +         +|
|         |_______________A_____M_________|                   |_M___A____| |
+--------------------------------------------------------------------------+
    N           Min           Max        Median           Avg        Stddev
x   5         0.133         0.137         0.136        0.1354  0.0015165751
+   5         0.139          0.14         0.139        0.1394 0.00054772256
Difference at 95.0% confidence
        0.004 +/- 0.00166288
        2.95421% +/- 1.22812%
        (Student's t, pooled s = 0.00114018)
```

Here we have a clearcut difference, not very big, but clear and unambiguous.


## Requirements

- C89-capable C compiler
- CMake 3.1 or later

## Want to help? Report a bug? Give feedback?

* This repository is not really under active development, but currently more in maintenance mode.
* Feel free to file any issue on the [Issues section](https://github.com/eyalroz/ministat/issues) of the GitHub repository - but note you might need to be the one writing a fix.
* If you're interested in expanding the utility's capabilities and/or co-maintaining it, please [email the repository maintainer](mailto:eyalroz1@gmx.com).
* Please avoid forking the repository if all you want is to clone existing work.
