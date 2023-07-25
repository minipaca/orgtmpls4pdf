;; Copyright (C) 2019 Xu Xin <xu2xin@gmail.com>.

(define f-disk-usage
  (lambda (path)
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
    (let ((p (path-without-last-separator path))
	  (files '()))
      (if (file-directory? p)
	  (set! files (get-subfiles-rec p))
	  (set! files (list p)))
      (let* ((ports (map open-input-file files))
	     (usage-list (map file-length ports)))
	(map close-port ports)
	(apply + usage-list)))))
