(define f-datum-file-read
  (lambda (path)
    (let* ((port (open-input-file path))
	   (datum (read port)))
      (close-port port)
      datum)))

