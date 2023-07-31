;; Copyright (c) 2023 Xu Xin <sxuxin@protonmail.com>

(define i-path-shorten
  (lambda (path)
    (let ((p path))
      ;;
      (let ((home (getenv "HOME")))
	(if (and (string? home)
		 (>= (string-length path) (string-length home)))
	    (cond
	     ((string=? path home) (set! p "~"))
	     (else (let* ((m (string-length path))
			  (n (string-length home))
			  (s1 (substring path 0 (+ n 1)))
			  (s2 (substring path (+ n 1) m)))
		     (if (string=? s1 (string-append home "/"))
			 (set! p (string-append "~/" s2))))))))
      ;;
      p)))
