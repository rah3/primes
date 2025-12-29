# Prime Constellations: Logic and Verification

This repository contains a formal verification and computational search for $k$-twin prime constellations using the Lean 4 interactive theorem prover and LaTeX for algorithmic specification.

## 🧮 Mathematical Background
A prime constellation is defined by a base prime $p$ and a set of offsets $\mathcal{O} = \{o_1, o_2, \dots, o_k\}$. This project focuses on:
- **Twin Primes**: $\{0, 2\}$
- **Prime Triplets**: $\{0, 2, 6\}$ and $\{0, 4, 6\}$
- **Prime Quadruplets**: $\{0, 2, 6, 8\}$

### The "Forbidden" Triplet
The constellation $\{0, 2, 4\}$ is proved to be impossible for $p > 3$ via modular arithmetic:
$$p \equiv 1 \pmod 3 \implies p+2 \equiv 0 \pmod 3$$
$$p \equiv 2 \pmod 3 \implies p+4 \equiv 0 \pmod 3$$

## 💻 Lean 4 Implementation
The core logic utilizes a `Decidable` instance for $k$-twin properties to allow for direct computation via the kernel.

```lean
def is_k_twin_prime (offsets : List ℕ) (p : ℕ) : Prop :=
  offsets.all (fun s => Nat.Prime (p + s))
```
