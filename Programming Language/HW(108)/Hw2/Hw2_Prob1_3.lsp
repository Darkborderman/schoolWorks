(defun fib1 (n)
    (if (< n 2)
        n 
		(+ (fib1 (- n 1)) (fib1 (- n 2)))))
		
(defun fib2 (n)
    (labels
        ((tailfib (num l m)
            (if (< num n)
                (tailfib (1+ num) (+ l m) l)
                l)))
        (tailfib 0 0 1)))
		
(trace fib1)
(fib1 8)
(terpri)
(trace fib2)
(fib2 8)
