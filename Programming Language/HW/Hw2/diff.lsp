(setf path1 
			(make-pathname :name "file1")
										)
(setf path2 
			(make-pathname :name "file2")
										)

(setf strin (open path1 :direction :input))

(format t "~A" strin)