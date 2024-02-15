(fun last
  () ()
  ((h)) h
  ((h . rest)) (last rest))

// (last '(1 2 3))


// testinput S-expression: '((A B C) (C D))



1:
(fun ff
  ((h . rest)) (if (symbol? h) h (ff h)))

2:
(fun ff
  (()) ()
  (( h . rest )) (if (number? h) (throw 'not-a-symbol) (ff h) )
  (() . rest) (ff rest)
  ((h . rest)) (if (symbol? h) h (ff h)))

(ff '(() 1))

(try
  (ff '(((a) c d) e) )
  (catch 'e
    (identity e)))



(ff '(((1) c d) e))

(ff '(a))


(fun ff_c
    (()) (throw 'not-a-symbol)
    ((head . rest)) (if (number? head)
        (throw 'not-a-symbol)
        (if (symbol? head) 
            head
            (ff_c head)
        )
    )
)

(try
  (ff_c '((a b) 1 a) )
  (catch 'e
    (identity e)))

(try
  (ff_c '(7) )
  (catch 'e
    (identity e)))


(ff_c '(() 1 a))

(ff_c '( () 1 ((a) 2 ) () 3 (d e)))


// finished
(fun ff_c
    (()) (throw 'not-a-symbol)
    ((head . rest)) (if (number? head)
        (throw 'not-a-symbol)
        (if (symbol? head) 
            head
            (ff_c head)
        )
    )
)

(try
  (ff_c '((a) 1 a) )
  (catch 'e
    (identity e)))


    // finished 2

    (fun ff_c
    (()) (throw 'not-a-symbol)
    ((head . rest)) 
        (try
            (if (number? head)
                (throw 'continue-search)
                (if (symbol? head)
                    head
                    (ff_c head)
                )
            )
            (catch 'continue-search
                (ff_c rest)
            )
        )
)





Final solution:

(fun ff_c
    (()) (throw 'not-a-symbol)
    ((head . rest)) 
        (try
            (if (number? head)
                (throw 'continue-search)
                (if (symbol? head)
                    head
                    (ff_c head)
                )
            )
            (catch 'e
                (ff_c rest)
            )
        )
)


(try
  (ff_c '(2 4 z 3) )
  (catch 'e
    e))


(try
  (ff_c '(() ((2) (1 (d) ) ) ) )
  (catch 'e
    e))


(try
  (ff_c '(()))
  (catch 'e
    e))


(fun ff_c
    (()) (throw 'not-a-symbol)
    ((head . rest)) 
        (try
            (if (number? head)
                (throw '(rest))
                (if (symbol? head)
                    head
                    (ff_c head)
                )
            )
            (catch 'e
                (ff_c e )
            )
        )
)

(try
  (ff_c '((1) (() (1 (d) ) ) ) )
  (catch 'e
    e))


(try
  (ff_c '(()))
  (catch 'e
    e))