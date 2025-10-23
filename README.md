# F-algebras-in-Haskell
Minimal F-algebra examples, extended to the tree acceptors of Bahr (2012)

For Falgebra0, install the data-fix package. On a ghcup-installed GHC platform that has cabal, this can be done with e.g.  ```cabal install --lib data-fix```

GHC is most stable on linux. But hese examples use only basic functions, less likely to break as Haskell evolves. 

Category theory introductions/summaries/refreshers for programmers:
Gibbons [2014](https://www.cs.ox.ac.uk/jeremy.gibbons/publications/cwh-slides.pdf),
[2003](https://www.cs.ox.ac.uk/jeremy.gibbons/publications/origami.pdf);
Milewski
[2017](https://bartoszmilewski.com/2013/06/10/understanding-f-algebras/)

In Falgebra1.hs, a minimal example of the Haskell `modular tree automata' of Bahr
[2012](https://bahr.io/pubs/files/bahr12mpc-paper.pdf).
