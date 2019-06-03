(defun SPLIT-LIST (L)
  (if (endp L)
      '(nil nil)
    (let ((X (split-list (cdr L))))
      (list  (cons (car L)(cadr X)) (car X) ))))

(defun MERGE-LISTS (L1 L2)
  (cond
   ((and(endp L1 )(endp L2)) nil )
   ((endp L1) (cons (CAR L2) (MERGE-LISTS nil (CDR L2))))
   ((endp L2) (cons (CAR L1) (MERGE-LISTS (CDR L1) NIL)))
   ((< (CAR L1) (CAR L2)) (cons (CAR L1) (MERGE-LISTS (CDR L1) L2  )))  
   ((>= (CAR L1) (CAR L2)) (cons (CAR L2) (MERGE-LISTS L1 (CDR L2))  ))))

(defun MSORT (L)
  (cond ((endp L) nil)
        ((endp (cdr L)) L)
        (t
         (let* ((S (SPLIT-LIST L ))
                (L1 (car S))
                (L2 (cadr S))
                (X (MSORT L1))
                (Y (MSORT L2)))
           (MERGE-LISTS X Y)))))
		   
(let 
	((n (read))
	   (numbers))
	(setf numbers
		(do ((i 0 (+ i 1))
			(tmp nil))
		((>= i n)
			(reverse tmp))
		(setf tmp (cons (read) tmp))))
	(format t "~{~A ~}~%" (MSORT numbers)))