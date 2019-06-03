(defun prime(input)
	(defvar temp (+ input -1))
	(loop for x from 2 to temp
		if(eql (mod input x) 0)
			do (+ x 1)
			(return-from prime NIL)
	)
	(return-from prime 1)
)

(print (prime 17))
