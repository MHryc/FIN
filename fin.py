import numpy as np
import math

dx = 0.01

def riemann_int(a, b, coefs) -> float:
    y = np.zeros
    k = math.ceil((b - a) / dx)

    for i in range(1, k + 1):
        x = a + (i - 1) * dx

    return integral
