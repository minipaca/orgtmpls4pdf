;; Copyright (C) 2019 Xu Xin <xu2xin@gmail.com>.

(define f-mkdir-rec
  (lambda (dir)
    ;;
    (define (get-non-exist-directories d l)
      (if (or (file-exists? d) (string=? (path-parent d) d))
	  l
	  (get-non-exist-directories (path-parent d) (cons d l))))
    ;;
    (define (mkdir-one-by-one dirlist)
      (if (not (null? dirlist))
	  (begin (mkdir (car dirlist))
		 (mkdir-one-by-one (cdr dirlist)))))
    ;;
    (let ((dirlist (get-non-exist-directories dir '())))
      (mkdir-one-by-one dirlist))))
