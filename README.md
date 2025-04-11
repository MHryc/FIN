# FIN

Numerical approximation of definite integrals writen in Fortran.

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
