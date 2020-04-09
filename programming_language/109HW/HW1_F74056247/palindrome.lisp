(defun palindrome (l)
  (equal l (reverse l)))

(setq x '(1 (2 3) 4))
(setq y '(1 2 3))

(palindrome '(x y x))