roots a b c = let
    det2 = b*b-4*a*c
    det = sqrt(det2)
    root1 = (-b + det)/2/a
    root2 = (-b-det)/2/a
    in [root1, root2]