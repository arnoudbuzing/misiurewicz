# Misiurewicz Points Package

This project provides a simple Wolfram Language package for computing Misiurewicz points of the Mandelbrot set.

## Overview

A **Misiurewicz point** is a parameter value $c$ for which the critical point $0$ of the iteration $f(z) = z^2 + c$ is strictly pre-periodic. This means it eventually enters a periodic cycle but never hits 0 again. These points are dense on the boundary of the Mandelbrot set and are crucial in the study of its fractal dynamics.

### Key Functionality

- **`MisiurewiczPoints[m, k]`**: Finds the set of parameter values $c$ where $0$ has a pre-period length $m$ and a period length $k$.
- **Robust Symbolic Solving**: The package uses `Solve` to find exact results (rational or `Root` objects) and `PossibleZeroQ` for reliable filtering.

## Usage

Load the package with the relative path to its source file:

```wolfram
Needs["Misiurewicz`", "scripts/Misiurewicz.wl"]

(* Find the "tip" of the Mandelbrot set (pre-period 2, period 1) *)
MisiurewiczPoints[2, 1]
(* Returns {-2} *)

(* Find the junction points at the top and bottom of the main cardioid (pre-period 2, period 2) *)
MisiurewiczPoints[2, 2]
(* Returns {-I, I} *)
```

## Running Tests

The project includes a verification test suite in the `tests/` directory.

### Using wolframscript

Run the automated test suite from the command line:

```bash
wolframscript -file scripts/RunTests.wl
```

## Project Structure

- `scripts/Misiurewicz.wl`: The main package source.
- `scripts/RunTests.wl`: A test runner script.
- `tests/Misiurewicz.wlt`: The unit test suite.
