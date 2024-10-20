{- Adapted from Bahr "Modular tree automata"
   http://dx.doi.org/10.1007/978-3-642-31113-0_14 
-}
newtype Fix f = Fix (f (Fix f))  -- Also available in the GHC Data.Fix library

-- Now we specify a particular functor F, a homomorphism over type a
data F a = And a a | Not a | TT | FF deriving Show
instance Functor F where             -- Compare GHC "deriving Functor"
  fmap f TT = TT
  fmap f FF = FF
  fmap f (Not x) = Not (f x)
  fmap f (And x y) = And (f x) (f y)

-- In Data.Fix, this is foldFix
-- With f a Functor, the catamorphism or fold of g through the term t:
cata :: Functor f => (f a -> a) -> (Fix f -> a)
cata g (Fix t) = g (fmap (cata g) t)

-- DUTA states
data Q = Q0 | Q1 deriving Show

-- F-algebra :: F a -> a
-- DUTA transition function: symbol to state
trans :: F Q -> Q
trans FF = Q0
trans TT = Q1
trans (Not Q0) = Q1
trans (Not Q1) = Q0
trans (And Q1 Q1) = Q1
trans (And _ _) = Q0

-- to get the state of any tree, we extend trans with cata
dutaState = cata trans

example1 = dutaState (Fix TT)
example1a = dutaState (Fix (Not (Fix TT)))
example1b = dutaState (Fix (And (Fix TT) (Fix TT)))

-- Let's evaluate states like this:
evalState :: Q -> Bool
evalState Q1 = True
evalState Q0 = False

-- Then, to get the value of any term:
dutaVal = evalState . dutaState

example2 = dutaVal (Fix TT)
example2a = dutaVal (Fix (Not (Fix TT)))
example2b = dutaVal (Fix (And (Fix TT) (Fix TT)))
