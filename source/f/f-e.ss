(define f-e
  (let ((e '()))
    (lambda (obj)
      (cond
       ((atom? obj) (assoc obj e))
       ((and (pair? obj) (atom? (car obj))) (set! e (cons obj e)))
       (else (f-e))))))

