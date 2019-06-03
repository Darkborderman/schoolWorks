(defun fact (n)
	(if(= n 0)
		1
		(* n (fact(- n 1)))))
		
(defun tailfact (n result)
	(if(= n 0)
		result
		(tailfact(- n 1)(* n result))))
		
(defun fact2(n)
	(tailfact n 1))
	
(trace fact)	
(print (fact 5))
(trace tailfact)
(print (fact2 5))
