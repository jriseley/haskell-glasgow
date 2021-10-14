roots a b c = let
    det2 = b*b-4*a*c
    det = sqrt(det2)
    root1 = (-b + det)/2/a
    root2 = (-b-det)/2/a
    in [root1, root2]

mymax x y = 
    if x > y 
    then
        x
    else
        y

-- TODO can I have a function that includes a case statement?

