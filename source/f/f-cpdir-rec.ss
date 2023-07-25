;; Copyright (C) 2019 Xu Xin <xu2xin@gmail.com>.

(define f-cpdir-rec
  (lambda (dir pdir)
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
    (define copy-file
      (lambda (from to)
	(define (pcopy pfrom pto)
	  (if (not (eof-object? (lookahead-u8 pfrom)))
	      (begin (put-u8 pto (get-u8 pfrom))
		     (pcopy pfrom pto))))
	(let ((pfrom (open-file-input-port from))
	      (pto (open-file-output-port to)))
	  (pcopy pfrom pto)
	  (close-port pfrom)
	  (close-port pto))))
    ;;
    (define get-subfiles
      (lambda (path)
	(let ((lst (directory-list path)))
	  (if (null? lst)
	      lst
	      (filter (lambda (obj) (not (file-directory? obj)))
		      (map (lambda (s)
			     (string-append
			      path (string (directory-separator)) s))
			   lst))))))
    ;;
    (define get-subdirectories
      (lambda (path)
	(let ((lst (directory-list path)))
	  (if (null? lst)
	      lst
	      (filter (lambda (obj) (file-directory? obj))
		      (map (lambda (s)
			     (string-append
			      path (string (directory-separator)) s))
			     lst))))))
    ;;
    (define (get-subdirectories-rec path)
      (define (r list1 list2)
	(if (null? list1)
	    list2
	    (let* ((d (car list1))
		   (ds1 (get-subdirectories d))
		   (ds2 (if (null? ds1)
			    ds1
			    (map (lambda (s) (string-append  s)) ds1))))
	      (r (append ds2 (cdr list1))
		 (append ds2 list2)))))
      (reverse (r (list path) (list path))))
    ;;
    (define get-subfiles-rec
      (lambda (path)
	(apply append (map get-subfiles (get-subdirectories-rec path)))))
    ;;
    (define (path-without-last-separator path)
      (if (or (string=? path "/") (string=? path "//"))
	  path
	  (let ((n (string-length path)))
	    (if (string=? (substring path (- n 1) n)
			  (string (directory-separator)))
		(path-without-last-separator (substring path 0 (- n 1)))
		path))))
    ;;
    (define (make-directory-one-by-one dirs)
      (if (not (null? dirs))
    	  (if (not (file-exists? (car dirs)))
    	      (begin (mkdir (car dirs))
    		     (make-directory-one-by-one (cdr dirs)))
    	      (make-directory-one-by-one (cdr dirs)))))
    ;;
    (let* ((path (path-without-last-separator dir))
	   (from-directories (get-subdirectories-rec path))
	   (from-files (get-subfiles-rec path))
	   (ppath (path-without-last-separator pdir))
	   (to-directories '())
	   (to-files '()))
      (let* ((n (- (string-length path) (string-length (path-last path))))      
	     (fd (map (lambda (s) (substring s n (string-length s)))
		      from-directories))
	     (ff (map (lambda (s) (substring s n (string-length s)))
		      from-files)))
	(set! to-directories
	      (map (lambda (s)
		     (string-append ppath (string (directory-separator)) s))
		   fd))
	(set! to-files
	      (map (lambda (s)
		     (string-append ppath (string (directory-separator)) s))
		   ff)))
      (make-directory-one-by-one to-directories)
      (map copy-file from-files to-files))))
