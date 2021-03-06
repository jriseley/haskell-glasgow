# Functional Programming in Haskell Code Examples

Author: Jenna Riseley
jf.riseley@gmail.com

This repository contains Haskell code examples from the University of Glasgow course hosted on FutureLearn.

My notes for the course are in `notes.md`.

The course materials are owned by [Jeremy Singer](http://dcs.gla.ac.uk/~jsinger) and [Wim Vanderbauwhede](http://www.dcs.gla.ac.uk/~wim/).


# Usage

## Play with example functions interactively 

Open prelude:

```
$ gchi
```

Load the functions defined in `lib.hs`:

```
Prelude> :load lib
```

Try one of the functions defined in `lib.hs`:

```
*Main> roots 10 34 2
```

## The starman.hs example from week 2

Week 2 includes an example "guessing game". 

## My solution to the week 2 implementation exercise

I implemented a guessing game in `guess.hs`.

```
$ ghci
$ Prelude> :load guess
$ *Main> guess 50 5
```