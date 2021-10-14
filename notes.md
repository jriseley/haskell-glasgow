---
author:
- mrcrial
title: Course notes for Functional Programming in Haskell
---

This course is offered by the University of Glasgow and hosted on
Futurelearn. It is roughly 24 hours of content offered over six weeks.

The code repo is hosted
[here](https://github.com/jriseley/haskell-glasgow).

Week 1
======

Introduction
------------

-   Haskell curry was a prominent 20th century logician
-   the Haskell committee got the approval of his widow to use his name
    for the language

Haskell basics: expressions and equations
-----------------------------------------

### Basic elements by example

-   Haskell only has expressions
-   The Haskell hello world:

``` {.haskell}
hello name = "Hello, " ++ name
```

-   note the concatenation operator `++`
-   **Types**: for functions, type declaration and function
    implementation are separate.

``` {.haskell}
sq :: Int -> Int -> Int
sq x y  = x*x + y*y
```

-   **Lists**: familiar syntax:

``` {.haskell}
lst = ["A","list","of","strings"]
```

-   Anonymous functions in Haskell are called ****Lambda**** functions:

``` {.haskell}
f = \x,y -> x*y+x+y
```

-   Higher-order functions:

``` {.haskell}
map (\x -> x*2+1) [1..10]
```

### Introduction to expressions and equations

-   Haskell has no statements, only expressions!
-   in Haskell, **all** computation is performed by evaluating
    expressions

So how can you perform computation without assignments? Think of an
assignment statement as doing three things:

1.  It evaluates the right hand side to compute a useful value
2.  It discards the value of the variable on the left hand side
3.  It saves the useful value of the right hand side into the variable

But in a pure functional language, we *never* destroy old values!

-   Things that look like assignment statements in imperative languages,
    are *not* updates of values, but equations. Eg: `n = n + 1` is an
    equation, not an assignment.

Haskell basics: reduction, functions and lists
----------------------------------------------

### More basic elements by example

-   anonymous functions are the foundation of Haskell:
    `f = \x y -> x*x + y*y`
-   **Let expressions**: these are the block structures you use to
    define functions.

``` {.haskell}
roots a b c = let
det2 = b*b-4*a*c
det = sqrt(det2)
root1=(-b+det)/2/a
root2=(-b-det)/2/a
in [root1,root2]
```

If then else in Haskell are not quite what you are used to - it is an
expression!

``` {.haskell}
mymax x y = 
    if x > y 
    then
  x
    else
  y
```

Higher order functions (functions that take other functions as
arguments) are used heavily in Haskell. For example:

    Prelude> map (\x->2*x) [1..10]

Will produce:

    [2,4,6,8,10,12,14,16,18,20]
