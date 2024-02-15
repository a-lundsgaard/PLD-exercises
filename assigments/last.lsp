(fun last
  () ()
  ((h)) h
  ((h . rest)) (last rest))

// (last '(1 2 3))

Make two versions: One that uses pattern matching, and one that uses if, #L and #R.

(fun last2 (xs) (if (#R xs)(last2 (#R xs))(#L xs) ) )

// (last2 '(1 2 3))