# FIN

Numerical integrator of definite integrals writen in Fortran. Currently the only
implemented method is 

$$ \int_{a}^{b} f(x) dx = \sum_{1}^{\frac{b - a}{dx}} f(x)\cdot dx $$

for $ dx = 0.01 $

## Usage

Run:

```
./fin fin.cfg
```

To specify polynomial coefficients and range over which to integrate edit the
`fin.cfg` file.

This:

```
4	-3	3
0.69	21	1.81	0.9773
```

represents:

$$ \int_{-3}^{3} 0.69\cdot x^0 + 21\cdot x^1 + 1.81\cdot x^2 + 0.9773\cdot x^3 dx $$
