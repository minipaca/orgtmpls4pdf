;; Copyright (c) 2023 Xu Xin <sxuxin@protonmail.com>

;;
(f-t (string->symbol (i-lang)))

;;
(let* ((home (case (machine-type)
	       ((a6nt ta6nt i3nt ti3nt) (getenv "userprofile"))
	       (else (getenv "HOME"))))
       (dir (string-append home "/.config/" (cdr (f-e "app-name"))))
       (file (string-append dir "/" (cdr (f-e "app-name")) ".datum.ss")))
  (f-e (cons "app-config-home" dir))
  (f-e (cons "app-config-path" file))
  (if (not (file-exists? dir))
      (f-mkdir-rec dir))      
  (if (not (file-exists? file))
      (let ((str (string-append "((\"9\" . \"" home "/9.txt\")\n"
				")\n"))
	    (port (open-output-file file)))
	(display str port)
	(close-port port))))

;;
(let ((x "x-usage")
      (parameters '()))
  ;;
  (if (>= (length (cdr (command-line))) 1)
      (begin
	(cond
	 ((string=? (cadr (command-line)) "-v") (set! x "x-version"))
	 ((string=? (cadr (command-line)) "-h") (set! x "x-usage")))
	(set! parameters (cddr (command-line)))))
  ;;
  (if (and (>= (length (cdr (command-line))) 2)
	   (string=? (cadr (command-line)) "-x"))
      (let ((s (caddr (command-line))))
	(case s
	 ("version" (set! x "x-version"))
	 ("usage" (set! x "x-usage"))
	 ("0" (set! x "x-0"))
	 ("1" (set! x "x-1"))
	 ("2" (set! x "x-2"))
	 ("9" (set! x "x-9"))
	 (else (set! x "x-usage")))
	(set! parameters (cdddr (command-line)))))
  ;;
  (display (eval (cons (string->symbol x) parameters)))
  (newline))
