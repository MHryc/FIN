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
<number of coefficients>\t<domain lower bound>\t<domain upper bound>\t<briefmode switch>
<1st coefficient>\t...<nth coefficient>
```

if briefmode is turned on only the final result of integration is printed.
Otherwise you'll get a message explaining the input and a table of x, y and
current integral as a cummulative sum. Briefmode entry in `fin.cfg` must be a
Fortran bool, i.e one of those `.true.`, `.t.`, `.false.`, `.f.`.

for eg.

```
4   -1  1   .true.
1   2   3   4
```

would integrate 

$$ 1 + 2x + 3x^2 + 4x^3 $$
$$ \mbox{for x: } -1 \leq x \leq 1 $$
