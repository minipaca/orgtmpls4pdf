;; Copyright (C) 2019 Xu Xin <xu2xin@gmail.com>.

(define f-rmdir-rec
  (lambda (path)
    (let ((files '())
	  (directories (list (list path))))
      ;;
      (define get-subfiles
	(lambda (path)
	  (let* ((objects (directory-list path))
		 (object-fullnames (map (lambda (str)
					  (string-append path "/" str))
					objects)))
	    (filter (lambda (object) (not (file-directory? object)))
		    object-fullnames))))
      ;;
      (define get-subdirectories
	(lambda (path)
	  (let* ((objects (directory-list path))
		 (object-fullnames (map (lambda (str)
					  (string-append path "/" str))
					objects)))
	    (filter (lambda (object) (file-directory? object))
		    object-fullnames))))
      ;;
      (define (rec-gather-information)
        (let ((dirs (car directories)))
	  (if (not (null? dirs))
	      (let ((subfiles (apply append (map get-subfiles dirs)))
		    (subdirectories (apply append
					   (map get-subdirectories dirs))))
		(set! files (append subfiles files))
		(set! directories (cons subdirectories directories))
		(rec-gather-information)))))
      ;;
      (define (rec-delete-directory-one-by-one! dirs)
	(if (not (null? dirs))
	    (begin (delete-directory (car dirs))
		   (rec-delete-directory-one-by-one! (cdr dirs)))))
      ;;
      (if (file-exists? path)
	  (begin
	    (rec-gather-information)
	    (map delete-file files)
	    (rec-delete-directory-one-by-one! (apply append directories)))))))

