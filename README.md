# FIN

Numerical integrator of definite integrals writen in Fortran. Currently the only
implemented methods are constant step quadrature, i.e. left Riemann sum, and
constant step trapezoid rule.

$$ \int_{a}^{b} f(x) dx = \sum_{i=0}^{\lfloor \frac{b - a}{dx} \rfloor } f(a + i\cdot dx)\cdot dx $$

## Usage

```
git clone https://github.com/MHryc/FIN.git
cd FIN
make
```

### config file (`fin.cfg`)

Currently config file has 2 lines.

1st line contains the number of coefficients,
upper and lower bound of integration domain, `briefmode` switch and algorithm
name.

`briefmode` must be a Fortran boolean (`.true.`, `.t.`, `.false.`, `.f.`), if
set to false `FIN` fill return information about the `fin.cfg` and x, y, and
cummulative sum integral for each step (due to refactoring briefmode switch is
ignored, but must be included in `fin.cfg`).

### available algorithms

| algorithm | name |
| --- | --- |
| Riemann sum | riemann |
| Trapezoid rule | trapezoid |

2nd line contains polynomial coefficients.

```
3	-1	1 .true.	riemann
0	0	1
```

This will integrate $x^2$ for $x$ between -1 and 1 using riemann sum and return
a single number (the 
