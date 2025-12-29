-- Import necessary components of the Mathlib library
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Algebra.Divisibility.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases
import Mathlib.Tactic

/-- A natural number p is a twin prime if both p and p + 2 are prime. -/
def is_twin_prime (p : ℕ) : Prop :=
  Nat.Prime p ∧ Nat.Prime (p + 2)

instance (p : ℕ) : Decidable (is_twin_prime p) :=
  inferInstanceAs (Decidable (Nat.Prime p ∧ Nat.Prime (p + 2)))

-- Enable Lean to calculate the true/false value of our definition
instance : DecidablePred is_twin_prime :=
  by unfold is_twin_prime; infer_instance

-- 1. COMPUTATION: Test the definition with specific numbers
#eval is_twin_prime 3    -- Output: true
#eval is_twin_prime 5    -- Output: true
#eval is_twin_prime 13   -- Output: false

-- 2. PROOF: Formally prove that 3 is a twin prime
example : is_twin_prime 3 := by
  unfold is_twin_prime
  constructor
  · decide  -- Proves the first part: 3 is prime
  · decide  -- Proves the second part: 3 + 2 (which is 5) is prime

-- 3. THE CONJECTURE: Formalize the statement we want to prove
def twin_prime_conjecture : Prop :=
  ∀ n : ℕ, ∃ p : ℕ, n < p ∧ is_twin_prime p

#print is_twin_prime  -- Prints the actual code/logic behind your definition
#print Nat.Prime      -- Prints how Mathlib defines a prime number

-- Since we defined a Decidable instance earlier:
instance : DecidablePred is_twin_prime := by unfold is_twin_prime; infer_instance

theorem three_is_twin_fast : is_twin_prime 3 := by
  decide

#print three_is_twin_fast

theorem five_is_twin_fast : is_twin_prime 5 := by
  decide

#print five_is_twin_fast

#eval (List.range 100).filter is_twin_prime
-- Output: [3, 5, 11, 17, 29, 41, 59, 71]

theorem seven_not_twin : ¬ is_twin_prime 7 := by
  decide

-- 1. Definitions
def is_k_twin_prime (offsets : List ℕ) (p : ℕ) : Prop :=
  offsets.all (fun s => Nat.Prime (p + s))

-- 2. Logic to bridge Prop to Bool
instance (offsets : List ℕ) (p : ℕ) : Decidable (is_k_twin_prime offsets p) :=
  inferInstanceAs (Decidable (offsets.all (fun s => Nat.Prime (p + s))))

-- 3. Specific Cases
def is_triplet_a (p : ℕ) := is_k_twin_prime [0, 2, 6] p
def is_quadruplet (p : ℕ) := is_k_twin_prime [0, 2, 6, 8] p

-- This "registers" the decidability for the specific name 'is_quadruplet'
instance (p : ℕ) : Decidable (is_quadruplet p) :=
  inferInstanceAs (Decidable (is_k_twin_prime [0, 2, 6, 8] p))

instance (p : ℕ) : Decidable (is_triplet_a p) :=
  match (inferInstance : Decidable (is_k_twin_prime [0, 2, 6] p)) with
  | isTrue h  => isTrue h
  | isFalse h => isFalse h

-- 4. Computations (Must be at the end)
#eval (List.range 100).filter (λ p => decide (is_triplet_a p))
#eval (List.range 100).filter (λ p => decide (is_quadruplet p))
