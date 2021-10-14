---
author:
- mrcrial
title: Course notes for Functional Programming in Haskell
---

This course is offered by the University of Glasgow and hosted on
Futurelearn. It is roughly 24 hours of content offered over six weeks.

I have created a code repo that incorporates examples from this course.
The repo is hosted [here](https://github.com/jriseley/haskell-glasgow).

I was not able to perform any of the exercises using the interactive
Haskell interpreter, due to a problem with the plugin.

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

``` {.haskell}
[2,4,6,8,10,12,14,16,18,20]
```

### Reduction, functions and lists

-   in imperative programs, statements are executed one after the other,
    and we keep track of the value of variables in the stack and where
    we are in the program (program counter)
-   We don't have this in functional programs, we have *reduction*
-   An expression is reduced by simplifying one reducible expression
    ("redex") at a time

/In functional programming, all computation is achieved purely by
reducing expressions/

-   the *essence* of functional programming is designing your own
    *functions* to solve problems!

Examples of list comprehensions:

``` {.haskell}
[3*x | x <- [1..10]]
-- >
[3,6,9,12,15,18,21,24,27,30]

[2*x | x <- [0..10]]
-- >
[0,2,4,6,8,10,12,14,16,18,20]

[2*x + 1 | x <- [0..10]]
-- >  
[1,3,5,7,9,11,13,15,17,19,21]

[[a,b] | a <- [10,11,12] , b <- [20,21]]
-- >
[[10,20],[10,21],[11,20],[11,21],[12,20],[12,21]]
```

Lists are lazy!

You can define a syntactically incorrect list and the interpreter will
not complain, as long as you don't access the incorrect part of the
list. Eg, this will not produce an error, despite the 3rd element being
invalid Haskell:

``` {.haskell}
Prelude> xs = [1, 2, xs !! 5, 4]
```

### Quiz

1.  Does the evaluation order of Haskell sub-expressions affect the
    overall value of the expression?

    - ****No, evaluation order does not affect the final value****
    -   If expressions are evaluated in a different order, then the
        final value might be different

2.  What is the difference between a named function and a lambda
    function assigned to a variable? For example:

    ``` {.haskell}
    f x = x + 1
    -- or
    f = \x -> x+1
    ```

    - ****There is no meaningful difference.****
    -   It is less efficient to define the functions in terms of
        lambdas.

3.  Given the definition:

        sum_ratio = \x y z -> (x + y ) / z

    then what is the value of:

        1 + 4* sum_ratio 4 2 3

    -   5

    - ****9****

4.  What does this expression evaluate to?

    ``` {.haskell}
    ['a','d' .. 'z']
    ```

    -   “adz”

    - ****“adgjmpsvy”****

5.  Given a list `xs`, what does the following expression evaluate to?

        []++xs == xs++[]

    - ****True****
    -   False

Haskell Building Blocks
=======================

More basic Haskell
------------------

### Zip that list!

-   zip takes a pair of lists and produces a list of pairs

    ``` {.haskell}
    Prelude> zip [1,2,3] [4,5,6]
    [(1,4),(2,5),(3,6)]
    Prelude> zip [1,2,3] "abc"
    [(1,'a'),(2,'b'),(3,'c')]
    ```

-   Also try `zip3`.
-   Zipping lists of disparate length will result in a list of pairs the
    same length as the shorter input list.
-   `zipWith` allows a function to be applied pairwise to produce a new
    list"

        zipWith max [1,2,3] [0,2,4]
        [1,2,4]

### Quiz: "Nothing but the truth"

1.  What is the value of this expression?

        let x = 5 in x == 5

    - ****True****
    -   False

2.  Which one of the following expressions should always evaluate to
    True?

    -   \~"haskell" &lt;&gt; "python"\~

    - \*\*\~"haskell" &lt; "python"`**
     - ~haskell < python`

3.  What is wrong with the following haskell expression?

        if (1) then "true" else "false"

    - ****The condition is incorrectly typed, since it is an integer
    value****

4.  Which of the following expressions does not evaluate to 42?

    -   `(*) 21 2`
    -   `[7,23,42] !! ((+) 1 1)`

    - ****`head (zip [42] [True])`****

5.  Given these definitions:

        a = "england"
        b = "scotland"

    then which one of the following expressions has the greatest integer
    value?

    -   `length (zip a b)`
    -   `length (zip a a)`

    - ****`length (zip b b)`****

Input and output
----------------

-   Haskell programs implement I/O using the "I/O Monad"
-   `getLine` and `putStrLn`
-   the point of IO types is to avoid mixing pure and impure functions.
-   `do` is used to (impurely) specify a sequence of actions
-   see the `starman.hs` example

Installing GHC
--------------

### What do you know about Haskell? Quiz

1.  What is wrong with this line of code, to return the number of
    characters typed by a user?

    -   The code associates the name x with the getLine function, rather
        than receiving a line of input from the user — and we can’t take
        length of a function.

2.  What is the type of this function?

        f name = putStrLn ("hello " ++ name)

    -   `[Char] -> IO ()`

3.  How do you find the type of a defined function f in ghci?

    -   `:type f`

4.  What is the difference between `->` and `<-` in Haskell syntax?

    -   `<-` is for associating names with values in `do` blocks whereas
        `->` is used for defining functions

5.  Why do you think the generation and use of pseudo-random numbers
    might occur inside a monad?

    -   because the sequence of pseudo-random numbers is important, and
        the programmer needs to control it. Monads are a powerful tool
        for sequencing operations.

### End of week 2

Coding challenge: using `starman.hs` as a starting point, implement
another guessing game in Haskell.

Data structures and types
=========================

Functions on lists
------------------

### Recursive functions on lists

In Haskell, there are two approaches to working with lists:

1.  Write functions to do what you want, using recursive definitions
    that traverse the list structure
2.  Write combinations of standard list processing functions

### Functional maps and folds versus imperative
