{- Minimal F-algebra using Fix as a type derived from type f.
-}

newtype Fix f = In (f (Fix f))  -- Also available in the GHC Data.Fix library.
-- But in Data.Fix, In is also called Fix -- overloading that type symbol.
-- Intuitively, the constructor In holds the fixed point.

-- Now we specify a particular functor F, a homomorphism over type a
data F a = Lit Int | Add a a deriving Show
instance Functor F where             -- Compare GHC 'deriving Functor'
 fmap f (Lit i) = Lit i
 fmap f (Add x y) = Add (f x) (f y)

-- With f a Functor, the catamorphism or fold of g through the term t:
cata :: Functor f => (f a -> a) -> (Fix f -> a)
cata g (In t) = g (fmap (cata g) t)
-- In Data.Fix, cata is foldFix.

-- Now the algebra F-algebra :: F a -> a maps elements to values
alg :: F Int -> Int
alg (Lit i) = i
alg (Add i j) = i + j

-- to get the value of any term in Fix F, we extend alg with cata
val :: Fix F -> Int
val = cata alg

example1 = val (In (Lit 1))
example1a = val (In (Add (In (Lit 2)) (In (Lit 3))))

{- 
> ghci
Loaded package environment
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help

ghci> :l Falgebra
[1 of 2] Compiling Main             ( Falgebra.hs, interpreted )
Ok, one module loaded.

ghci> :t (Lit 2)
(Lit 2) :: F a

ghci> :t (In (Lit 1))
(In (Lit 1)) :: Fix F

ghci> :t (Add (In (Add (In (Lit 2)) (In (Lit 3)))) (In (Add (In (Lit 2)) (In (Lit 3)))))
(Add (In (Add (In (Lit 2)) (In (Lit 3)))) (In (Add (In (Lit 2)) (In (Lit 3))))) :: F (Fix F)

ghci> :t (In (Add (In (Lit 2)) (In (Lit 3))))
(In (Add (In (Lit 2)) (In (Lit 3)))) :: Fix F

ghci> :t (In (Add (In (Add (In (Lit 2)) (In (Lit 3)))) (In (Add (In (Lit 2)) (In (Lit 3))))))
(In (Add (In (Add (In (Lit 2)) (In (Lit 3)))) (In (Add (In (Lit 2)) (In (Lit 3)))))) :: Fix F

ghci> example1
1

ghci> example1a
5
-}
