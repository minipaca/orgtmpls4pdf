(define f-t
  (let ((t '())
	(l 'default))
    (lambda (obj)
      (cond
       ((symbol? obj) (set! l obj))
       ((string? obj) (let ((result (assoc (cons l obj) t)))
			(if (equal? result #f)
			    (cons (cons l obj) obj)
			    result)))
       ((and (pair? obj) (string? (car obj)) (string? (cdr obj)))
	(set! t (cons (cons (cons l (car obj)) (cdr obj)) t)))
       (else (f-t))))))

