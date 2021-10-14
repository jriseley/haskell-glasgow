
-- Ask the user to guess a number. 
-- I'm not sure how to generate random numbers in Haskell, so we will generate a random number by hashing a string that the user inputs. 

hashToInt :: String -> Int 
hashToInt salt = mod (37*(length salt)) 30 -- my sad little hash

guess :: Int -> IO ()
guess n = do
    putStrLn ("Starting guessing game")
    putStr "Enter a magic phrase:"
    magicPhrase <- getLine
    --putStrLn ("Entered magic phrase" ++ q)
    putStrLn("Number: ")
    print(hashToInt magicPhrase)
    putStrLn("done")