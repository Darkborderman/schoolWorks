(defparameter strin1 '() )
(defparameter strin2 '() )

(let ( (in (open "file1.txt")) strin1 ) 
  ;(format t "~a~%" (read-line in))
  ;(format t "~a~%" (read-line in))
 
  (push (read-line in) strin1)
  ;(push (read-line in1) strin1 ) 
  (format t "~a~%" strin1)
  (reverse strin1)
 
  (format t "~a~%" strin1)
 
   (close in))
   
   
(let ( (in (open "file2.txt")) strin2 )
  (push (read-line in) strin2)
  
  (format t "~a~%" strin2)
  
  (close in))