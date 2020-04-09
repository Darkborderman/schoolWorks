(defun fib1 (n)
  (if (< n 2) n
    (+ (fib1 (1- n)) (fib1 (- n 2))))
)

(trace fib1)
(print (fib1 10))
