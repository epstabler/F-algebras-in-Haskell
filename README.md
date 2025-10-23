# F-algebras-in-Haskell
Minimal F-algebra examples, extended to the tree acceptors of Bahr (2012)

For Falgebra0, install the data-fix package, e.g. with ```cabal install --lib data-fix```

I have tried to stick to basic functions that are less likely to break as Haskell evolves.
With changes, new bugs seem to be fixed first on the linux platforms.

Category theory introductions/summaries/refreshers for programmers:
Gibbons [2014](https://www.cs.ox.ac.uk/jeremy.gibbons/publications/cwh-slides.pdf),
[2003](https://www.cs.ox.ac.uk/jeremy.gibbons/publications/origami.pdf);
Milewski
[2017](https://bartoszmilewski.com/2013/06/10/understanding-f-algebras/)

In Falgebra1.hs, a minimal example of the Haskell `modular tree automata' of Bahr
[2012](https://bahr.io/pubs/files/bahr12mpc-paper.pdf).
