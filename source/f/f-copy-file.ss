(define f-copy-file
  (lambda (from to)
    ;;
    (define (pcopy pfrom pto)
      (if (not (eof-object? (lookahead-u8 pfrom)))
	  (begin (put-u8 pto (get-u8 pfrom))
		 (pcopy pfrom pto))))
    ;;
    (let ((pfrom (open-file-input-port from))
	  (pto (open-file-output-port to)))
      (pcopy pfrom pto)
      (close-port pfrom)
      (close-port pto))))
