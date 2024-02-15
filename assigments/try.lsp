
(define identity (lambda (x) x ))

(define risky
  (lambda (x)
    (if (> x 0)
        x
        (throw '-1))))

(define risky
  (lambda (x)
    (if (> x 0)
        x
        (throw 'a))))


(try
  (risky -1)
  (catch 'e
    (identity e)))













(try
  (risky -1)
  (catch 'e
    (identity 2)))

(try
  (risky 5)
  (catch 'e
    'this-will-not-run))


(try
  (risky 5 (catch 'e
    'this-will-not-run))
  )


  (try
  (risky -1)
  (catch 'e
    (process-exception e)))