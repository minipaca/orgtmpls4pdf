;; Copyright (C) 2019 Xu Xin <xu2xin@gmail.com>.

(define f-which-executable-file
  (lambda (name)
    ;;
    (define (string-split str delim)
      (define in (open-input-string str))
      (let loop ((rv '()) (out (open-output-string)))
	(define c (read-char in))
	(cond ((eof-object? c)
	       (reverse (cons (get-output-string out) rv)))
	      ((char=? c delim)
	       (loop (cons (get-output-string out) rv)
		     (open-output-string)))
	      (else
	       (write-char c out)
	       (loop rv out)))))
    ;;
    (define executable-file?
      (lambda (file)
	(let ((n #b001000000)
	      (mode (get-mode file)))
	  (= (logand mode n) n))))
    ;;
    (let ((path (string-split (getenv "PATH") #\:)))
      (if (and (list? path)
	       (not (null? path)))
	  (let* ((files (map (lambda (s)
			       (string-append s "/" name))
			     path))
		 (lst (filter (lambda (file)
				(and (file-exists? file)
				     (executable-file? file)))
			      files)))
	    (if (null? lst)
		#f
		(car lst)))
	  #f))))

