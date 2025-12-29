# Prime Constellations & Twin Prime Verification
A Lean 4 and LaTeX project to identify and formally prove $k$-twin prime constellations.

## 🚀 Overview
This project explores the density of prime clusters. It includes:
- **Lean 4 Logic**: A decidable procedure to filter prime triplets and quadruplets.
- **Formal Proofs**: LaTeX documentation using `amsmath` and `algorithm2e` to prove why certain constellations (like $[0, 2, 4]$) are impossible for $p > 3$.

## 🔢 Verified Triplets
Using our Lean algorithm, we verified the following triplets $(p, p+2, p+6)$ for $p < 100$:
`[5, 11, 17, 41]`

## 🛠 Tech Stack
- **Theorem Prover**: Lean 4 (using `Mathlib.Data.Nat.Prime`)
- **Typesetting**: LaTeX (`algorithm2e`, `amsthm`, `booktabs`)
- **Layout**: Scribus (for the Agile Scrum Worksheet)
- **Version Control**: Git & GitHub

## 📝 How to Run
```bash
lake env lean TwinPrimes.lean
```

---

### 2. Push the Final Update
Now, push the README to GitHub to make your profile look professional:

```bash
git add README.md
git commit -m "Docs: Added README with project overview and results"
git push origin main
```
