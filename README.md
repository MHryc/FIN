# FIN

Numerical integrator of definite integrals writen in Fortran. Currently the only
implemented method is a constant step quadrature, i.e. left Riemann sum:

$$ \int_{a}^{b} f(x) dx = \sum_{i=0}^{\lfloor \frac{b - a}{dx} \rfloor } f(a + i\cdot dx)\cdot dx $$

for $ dx = 0.01 $

## Usage

Compile `fin.f90` into `fin`, and run:

```
./fin fin.cfg
```

Coefficients, integration domain and coefficients are defined in `fin.cfg` file
that has exactly 2 lines.

```
<number of coefficients>\t<domain lower bound>\t<domain upper bound>
<1st coefficient>\t...<nth coefficient>
```

for eg.

```
4   -1  1
1   2   3   4
```

would integrate 

$$ 1 + 2x + 3x^2 + 4x^3 $ for $ -1 \leq x \leq 1 $$
