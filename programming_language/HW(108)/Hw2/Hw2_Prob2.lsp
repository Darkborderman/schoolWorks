(defun split (numbers)
	(if (endp numbers)
		nil
		(let ((num (split (cdr numbers))))
			(list (cons (car numbers) (cadr num)) (car num)))))

(defun merging (list_h list_l)
	(cond
		((and (endp list_h ) (endp list_l)) 
			nil )
		((endp list_h)
			(cons (car list_l) (merging nil (cdr list_l))))
		((endp list_l)
			(cons (car list_h) (merging (cdr list_h) nil)))
		((< (car list_h) (car list_l))
			(cons (car list_h) (merging (cdr list_h) list_l)))  
		((>= (car list_h) (car list_l))
			(cons (car list_l) (merging list_h (cdr list_l))))))

(defun mergesort (numbers)
	(cond ((endp numbers) nil)
			((endp (cdr numbers)) numbers)
			(t
				(let* ((list_s (split numbers))
						(list_h (car list_s))
						(list_l (cadr list_s))
						(list1 (mergesort list_h))
						(list2 (mergesort list_l)))
					(merging list1 list2)))))
		   
(let 
	((n (read))
	   (numbers))
	(setf numbers
		(do ((i 0 (+ i 1))
			(tmp nil))
		((>= i n)
			(reverse tmp))
		(setf tmp (cons (read) tmp))))
	(format t "~{~A ~}~%" (mergesort numbers)))