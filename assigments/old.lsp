// test if its a symbol and not a list

// if x is a symbol, return x
(atom 

)

(ff '((A B C) (C D)) )


# first try

(fun ff (x)
  (if (symbol? x) x
      ((x . xs) (ff x) )
      (() ())))


(ff '((A B C) (C D)) )

(ff '(1 2 3))


(fun ff
  (()) ()
  ((h)) (if (symbol? h) h ()) 
  ((h . rest)) 
    (if (symbol? h) 
        h
        (ff rest))) 


(fun ff
  (()) ()
  ((h)) (if (symbol? h) h ()) 
  ((h . rest)) (if (symbol? h) h (ff h)) 
  ((h . rest)) 
    (ff rest)) 


(fun ff
  (()) ()
  ((h)) (if (symbol? h) h ()) 
  ((h . rest)) 
    (ff rest)) 



(fun ff
  () ()
  ((Symbol x) x)
  (((Symbol x) . rest) x)
  ((h . rest) (ff h))
  ((. rest) (ff rest)))

// (ff '(((b) c d) e))

