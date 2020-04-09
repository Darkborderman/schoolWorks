(defun fib2 (n)
  (labels ((fib2-tail (n a b)
    (if (= n 0)
      a
    (fib2-tail (- n 1) b (+ a b)))))
  (fib2-tail n 0 1))
)

(trace fib2)
(print (fib2 10))
