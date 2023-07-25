(define f-datum-file-write
  (lambda (obj path)
    (let ((port (open-output-file path)))
      (write obj port)
      (close-port port))))

