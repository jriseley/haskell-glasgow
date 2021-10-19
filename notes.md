
# Table of Contents

- [Table of Contents](#table-of-contents)
- [Week 1](#week-1)
  - [Introduction](#introduction)
  - [Haskell basics: expressions and equations](#haskell-basics-expressions-and-equations)
    - [Basic elements by example](#basic-elements-by-example)
    - [Introduction to expressions and equations](#introduction-to-expressions-and-equations)
  - [Haskell basics: reduction, functions and lists](#haskell-basics-reduction-functions-and-lists)
    - [More basic elements by example](#more-basic-elements-by-example)
    - [Reduction, functions and lists](#reduction-functions-and-lists)
    - [Quiz](#quiz)
- [Haskell Building Blocks](#haskell-building-blocks)
  - [More basic Haskell](#more-basic-haskell)
    - [Zip that list!](#zip-that-list)
    - [Quiz: "Nothing but the truth"](#quiz-nothing-but-the-truth)
  - [Input and output](#input-and-output)
  - [Installing GHC](#installing-ghc)
    - [What do you know about Haskell? Quiz](#what-do-you-know-about-haskell-quiz)
    - [End of week 2](#end-of-week-2)
- [Data structures and types](#data-structures-and-types)
  - [Functions on lists](#functions-on-lists)
    - [Recursive functions on lists](#recursive-functions-on-lists)
    - [Functional maps and folds versus imperative](#functional-maps-and-folds-versus-imperative)
    - [Do it yourself: lists and recursion exercise](#do-it-yourself-lists-and-recursion-exercise)
    - [Do it yourself: function composition exercise](#do-it-yourself-function-composition-exercise)
    - [What have we learned about lists?](#what-have-we-learned-about-lists)
    - [Write a spelling book generator exercise](#write-a-spelling-book-generator-exercise)
  - [Define your own data types](#define-your-own-data-types)

This course is offered by the University of Glasgow and hosted on Futurelearn. It is roughly 24 hours of content offered over six weeks.

I have created a code repo that incorporates examples from this course. The repo is hosted [here](https://github.com/jriseley/haskell-glasgow).

I was not able to perform any of the exercises using the interactive Haskell interpreter, due to a problem with the plugin. 


<a id="orgd442c3d"></a>

# Week 1


<a id="orge027e04"></a>

## Introduction

-   Haskell curry was a prominent 20th century logician
-   the Haskell committee got the approval of his widow to use his name for the language


<a id="orgd2129c5"></a>

## Haskell basics: expressions and equations


<a id="org97a34a3"></a>

### Basic elements by example

-   Haskell only has expressions
-   The Haskell hello world:

    hello name = "Hello, " ++ name

-   note the concatenation operator `++`
-   **Types**: for functions, type declaration and function implementation are separate.

    sq :: Int -> Int -> Int
    sq x y  = x*x + y*y

-   **Lists**: familiar syntax:

    lst = ["A","list","of","strings"]

-   Anonymous functions in Haskell are called ****Lambda**** functions:

    f = \x,y -> x*y+x+y

-   Higher-order functions:

    map (\x -> x*2+1) [1..10]


<a id="org132ec8b"></a>

### Introduction to expressions and equations

-   Haskell has no statements, only expressions!
-   in Haskell, **all** computation is performed by evaluating expressions

So how can you perform computation without assignments? Think of an assignment statement as doing three things:

1.  It evaluates the right hand side to compute a useful value
2.  It discards the value of the variable on the left hand side
3.  It saves the useful value of the right hand side into the variable

But in a pure functional language, we *never* destroy old values!

-   Things that look like assignment statements in imperative languages, are *not* updates of values, but equations. Eg: `n = n + 1` is an equation, not an assignment.


<a id="orge9d4bbe"></a>

## Haskell basics: reduction, functions and lists


<a id="org0fe19a1"></a>

### More basic elements by example

-   anonymous functions are the foundation of Haskell: `f = \x y -> x*x + y*y`

-   **Let expressions**: these are the block structures you use to define functions.

    roots a b c = let
    det2 = b*b-4*a*c
    det = sqrt(det2)
    root1=(-b+det)/2/a
    root2=(-b-det)/2/a
    in [root1,root2]

If then else in Haskell are not quite what you are used to - it is an expression!

    mymax x y = 
        if x > y 
        then
    	x
        else
    	y

Higher order functions (functions that take other functions as arguments) are used heavily in Haskell. For example: 

    Prelude> map (\x->2*x) [1..10]

Will produce:

    [2,4,6,8,10,12,14,16,18,20]


<a id="org37fa354"></a>

### Reduction, functions and lists

-   in imperative programs, statements are executed one after the other, and we keep track of the value of variables in the stack and where we are in the program (program counter)
-   We don't have this in functional programs, we have *reduction*
-   An expression is reduced by simplifying one reducible expression ("redex") at a time

*In functional programming, all computation is achieved purely by reducing expressions*

-   the *essence* of functional programming is designing your own *functions* to solve problems!

Examples of list comprehensions:

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

Lists are lazy!

You can define a syntactically incorrect list and the interpreter will not complain, as long as you don't access the incorrect part of the list. Eg, this will not produce an error, despite the 3rd element being invalid Haskell:

    Prelude> xs = [1, 2, xs !! 5, 4]


<a id="org21b9b4a"></a>

### Quiz

1.  Does the evaluation order of Haskell sub-expressions affect the overall value of the expression?
    -   ****No, evaluation order does not affect the final value****
    -   If expressions are evaluated in a different order, then the final value might be different

2.  What is the difference between a named function and a lambda function assigned to a variable? For example:
    
        f x = x + 1
        -- or
        f = \x -> x+1
    
    -   ****There is no meaningful difference.****
    -   It is less efficient to define the functions in terms of lambdas.

3.  Given the definition:
    
        sum_ratio = \x y z -> (x + y ) / z
    
    then what is the value of:
    
        1 + 4* sum_ratio 4 2 3
    
    -   5
    -   ****9****

4.  What does this expression evaluate to?
    
        ['a','d' .. 'z']
    
    -   “adz”
    -   ****“adgjmpsvy”****

5.  Given a list `xs`, what does the following expression evaluate to?
    
        []++xs == xs++[]
    
    -   ****True****
    -   False


<a id="orge06f5be"></a>

# Haskell Building Blocks


<a id="orge28ae8c"></a>

## More basic Haskell


<a id="org518d376"></a>

### Zip that list!

-   zip takes a pair of lists and produces a list of pairs
    
        Prelude> zip [1,2,3] [4,5,6]
        [(1,4),(2,5),(3,6)]
        Prelude> zip [1,2,3] "abc"
        [(1,'a'),(2,'b'),(3,'c')]

-   Also try `zip3`.
-   Zipping lists of disparate length will result in a list of pairs the same length as the shorter input list.
-   `zipWith` allows a function to be applied pairwise to produce a new list"
    
        zipWith max [1,2,3] [0,2,4]
        [1,2,4]


<a id="orgb6d97e6"></a>

### Quiz: "Nothing but the truth"

1.  What is the value of this expression?
    
        let x = 5 in x == 5
    
    -   ****True****
    -   False

1.  Which one of the following expressions should always evaluate to True?
    -   `"haskell" <> "python"`
    -   ****`"haskell" < "python"`****
    -   `haskell < python`

2.  What is wrong with the following haskell expression?
    
        if (1) then "true" else "false"
    
    -   ****The condition is incorrectly typed, since it is an integer value****

3.  Which of the following expressions does not evaluate to 42?
    -   `(*) 21 2`
    -   `[7,23,42] !! ((+) 1 1)`
    -   ****`head (zip [42] [True])`****

4.  Given these definitions:
    
        a = "england"
        b = "scotland"
    
    then which one of the following expressions has the greatest integer value?
    
    -   `length (zip a b)`
    -   `length (zip a a)`
    -   ****`length (zip b b)`****


<a id="orgff58f12"></a>

## Input and output

-   Haskell programs implement I/O using the "I/O Monad"
-   `getLine` and `putStrLn`
-   the point of IO types is to avoid mixing pure and impure functions.
-   `do` is used to (impurely) specify a sequence of actions
-   see the `starman.hs` example


<a id="org0f24b40"></a>

## Installing GHC


<a id="org057948e"></a>

### What do you know about Haskell? Quiz

1.  What is wrong with this line of code, to return the number of characters typed by a user?
    -   The code associates the name x with the getLine function, rather than receiving a line of input from the user — and we can’t take length of a function.

2.  What is the type of this function?
    
        f name = putStrLn ("hello " ++ name)
    
    -   `[Char] -> IO ()`

3.  How do you find the type of a defined function f in ghci?
    -   `:type f`

4.  What is the difference between `->` and `<-` in Haskell syntax?
    -   `<-` is for associating names with values in `do` blocks whereas `->` is used for defining functions

5.  Why do you think the generation and use of pseudo-random numbers might occur inside a monad?
    -   because the sequence of pseudo-random numbers is important, and the programmer needs to control it. Monads are a powerful tool for sequencing operations.


<a id="orga24edd2"></a>

### End of week 2

Coding challenge: using `starman.hs` as a starting point, implement another guessing game in Haskell. 


<a id="org5b726c0"></a>

# Data structures and types


<a id="org62af580"></a>

## Functions on lists


<a id="org4f0c922"></a>

### Recursive functions on lists

In Haskell, there are two approaches to working with lists:

1.  Write functions to do what you want, using recursive definitions that traverse the list structure
2.  Write combinations of standard list processing functions

**Recursion on list**

-   a list is built from the empty list `[]` and the function `cons` of type `a -> [a] -> [a]`
-   in Haskell, the cons operator is `(:)`, pronounced cons
-   every list must be either:
    -   `[]` or
    -   `(x:xs)` for some `x` (the head of the list) and `xs` (the tail)
-   a recursive definition follows this structure:
    -   base case of the recursion for the empty list
    -   recursion (or induction case) for `(x:xs)`

**Computation over lists**

-   many computations that would be for/ while loops in imperative programming are naturally expressed as list computations in a functional language
-   common cases:
    -   perform a computation over each element on a list: `map`
    -   iterate over a list from left to right: `foldl`
    -   iterate over a list from right to left: `foldr`
-   it's good practice to use these three functions when applicable


<a id="org4606939"></a>

### Functional maps and folds versus imperative


<a id="org1a3affc"></a>

### Do it yourself: lists and recursion exercise

It asked us to implement our own version of `filter` on a single line:

    myfilter cond lst = if lst == [] then 
      []
    else 
      let x:xs = lst in if 
        (cond x == True) 
      then x : myfilter cond xs 
      else 
        myfilter cond xs

This works. The reference implementation:

    filter pred lst
      | null lst = []
      | otherwise = if pred x 
         then x:filter pred xs
         else filter pred xs
           where x:xs=lst


<a id="org33e39be"></a>

### Do it yourself: function composition exercise


<a id="orgef315b2"></a>

### What have we learned about lists?

1.  A *recursive* function must have at least two cases. What are they called?
    -   base case and induction case

2.  What is wrong with the following definition of `filter`?

    filter :: (a -> Bool) -> [a] -> [a]
        filter pred []    = []
        filter pred (x:xs)
          | pred x         = x : filter pred xs
          | otherwise      = filter pred (x:xs)

-   The recursion for the non-matching case should operate on xs, not on (x:xs)

1.  What is the effect of the following fold? `foldl (\acc elt -> acc++[elt]) "" "A string"`

2.  What is the wrong with the following map/fold-based computation?
    
        foldl (+) (map (*2) [1..8])
    
    -   foldl needs an accumulator argument.

3.  What is the result of the following operation:
    
        foldr (/) 1 [2,4,8]
    
    -   think of this as the following:
    
        2/(4/(8/1))
    
    -   so the answer is `4.0`

4.  What is the result of:
    
        foldl (/) 16 [8,4,2,1]
    
    -   think of this as: `((((16/8)/4)/2)/1))` so `0.25`


<a id="orgbd1d410"></a>

### Write a spelling book generator exercise

See `speller.hs`


<a id="org2d74d28"></a>

## Define your own data types

