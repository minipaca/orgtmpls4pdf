;; Copyright (c) 2023 Xu Xin <sxuxin@protonmail.com>

(define (f-string-split-by-string str1 str2)
  ;;
  (define (rec result temps s1 s2)
    (let ((n1 (string-length s1))
	  (n2 (string-length s2)))
      (if (< n1 n2)
	  (append result (list (string-append temps s1)))
	  (if (string=? (substring s1 0 n2) s2)
	      (rec (append result (list temps)) ""
		   (substring s1 n2 n1) s2)
	      (rec result (string-append temps (substring s1 0 1))
		   (substring s1 1 n1) s2)))))
  ;;
  (cond ((string=? str1 "") '())
	((string=? str2 "") (list str1))
	((< (string-length str1) (string-length str2)) (list str1))
	(else (rec '() "" str1 str2))))
