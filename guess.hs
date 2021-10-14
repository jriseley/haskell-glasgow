
-- Number guessing game
-- Author: Jenna Riseley
-- jf.riseley@gmail.com

-- This game was implemented as part of the week 2 exercise in "Functional Programming in Haskell" 
-- https://www.futurelearn.com/courses/functional-programming-haskell/

-- It's also my first ever Haskell program. Yay!!

-------------------------------------------------------------------------------

-- Load this file into ghci:

-- $ ghci
-- Prelude> :load guess

-- And then start the game with parameters:
-- N: you will be asked to guess a number in [1,N] inclusive
-- guesses: number of guesses before you lose

-- *Main> guess N guesses

-- You will be prompted for a random phrase that will generate the magic number.

-- ----------------------------------------------------------------------------

-- I'm not sure how to generate random numbers in Haskell, 
-- so we will generate a pseudorandom number by hashing a string that the user inputs. 
hashToInt :: String -> Int -> Int 
hashToInt salt modulo = (mod (37*(length salt)) modulo) + 1

getHint :: Int -> Int -> String 
getHint guess target = if guess < target then "Try a bigger number..." else "Try a smaller number..."

mkguess :: Int -> Int -> IO ()
mkguess magicNumber n = do 
        putStrLn "  Enter your guess: "
        guessStr <- getLine
        let guess = read guessStr :: Int
        let correct = magicNumber == guess
        let n' = if correct then n else n-1
        if n'==0 then putStrLn ("You lose! The magic number: " ++ (show magicNumber))
                 else if magicNumber==guess
                 then putStrLn "You win!"
                 else do
                     putStrLn(getHint guess magicNumber)
                     mkguess magicNumber n'


guess :: Int -> Int -> IO ()
guess modulo n = do
    putStrLn ("Starting guessing game")
    putStr "Enter a magic phrase: "
    magicPhrase <- getLine
    putStrLn("Generating a magic number between 1 and " ++ (show modulo) ++ " inclusive ... done!")
    mkguess (hashToInt magicPhrase modulo) n


