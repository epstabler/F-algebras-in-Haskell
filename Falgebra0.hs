{- Minimal F-algebra using Fix as parameterized type -}

import Data.Fix  -- Use e.g.: ghci -package data-fix

-- Now we specify a particular functor F, a homomorphism over type a
data F a = Lit Int | Add a a deriving (Show,Functor)

-- Now the F-algebra :: F a -> a maps elements to values
alg :: F Int -> Int
alg (Lit i) = i
alg (Add i j) = i + j

-- To define values for all terms in Fix F, extend alg with catamorphism
val :: Fix F -> Int
val = foldFix alg

example1 = val (Fix (Lit 1))
example1a = val (Fix (Add (Fix (Lit 2)) (Fix (Lit 3))))

{- 
> ghci -package data-fix
Loaded package environment
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help

ghci> :l Falgebra0
[1 of 2] Compiling Main             ( Falgebra0.hs, interpreted )
Ok, one module loaded.

ghci> Add (Lit 1) (Lit 2)
Add (Lit 1) (Lit 2)

ghci> :t Add (Lit 1) (Lit 2)
Add (Lit 1) (Lit 2) :: F (F a)

ghci> :t Add (Add (Lit 1) (Lit 2)) (Add (Lit 1) (Lit 2))
Add (Add (Lit 1) (Lit 2)) (Add (Lit 1) (Lit 2)) :: F (F (F a))

ghci> example1
1

ghci> example1a
5
-}
