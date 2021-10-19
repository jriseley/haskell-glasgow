-- EXERCISE 3.7 Write a spelling book generator

-- Are you familiar with children’s alphabetical spelling books? They say things like: a is for apple, b is for baby, and c is for cat

-- Now that you know about Haskell list functions, you can develop a function to generate the text for a spelling book, given a list of words.

-- Suppose the function is called speller then it should have the following type:

-- speller :: [[Char]] -> [Char]

-- recalling that a list of Char elements is a String in Haskell.

-- Typical executions of the speller function would look like this:

-- speller ["abacus"] -- > "a is for abacus"
-- speller [] -- > ""
-- speller ["apple", "banana", "coconut"] 
--  -- > "a is for apple, b is for banana, and c is for coconut"
-- speller ["whisky", "x-ray"]
--  -- > "w is for whisky, and x is for x-ray"

phraseFromWord :: [Char] -> [Char]
phraseFromWord word = let x:xs = word in [x]++" is for "++word

speller :: [[Char]] -> [Char]
speller [] = ""
speller lst = let x:xs = lst in if xs == [] then "and " ++ (phraseFromWord x)  else phraseFromWord x ++ ", " ++ speller xs