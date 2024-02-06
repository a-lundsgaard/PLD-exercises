(fun last
  () ()
  ((h)) h
  ((h . rest)) (last rest))

// (last '(1 2 3))

Make two versions: One that uses pattern matching, and one that uses if, #L and #R.


Make one that uses if, #L and #R.
// 
(fun last (list)
  (if (#R list) ; Checks if there is a rest of the list.
      (last (#R list)) ; Recursively calls `last` on the rest of the list.
      (#L list))) ; Returns the first (and only, in this context) element of the list.


(fun equal
  (x x) ’T
  (x y) ())

(fun last (list) (if (equal (#R list) ()) 
      (#L list) 
      (last (#R list))))

(fun last2 (xs) (if (#R xs)(last2 (#R xs))(#L xs) ) )

// (last2 '(1 2 3))