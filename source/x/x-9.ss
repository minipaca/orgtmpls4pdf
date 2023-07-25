;; Copyright (c) 2023 Xu Xin <sxuxin@protonmail.com>

(define x-9
  (lambda parameters
    ;;
    (if (not (file-exists? (cdr (f-e "app-config-path"))))
	(let ((str (string-append (cdr (f-t "Config file not found: "))
				  (cdr (f-e "app-config-path")) "\n")))
	  (display str)
	  (exit)))
    ;;
    (let ((9file (cdr (assoc "9" (f-datum-file-read
				  (cdr (f-e "app-config-path")))))))
      (if (not (file-exists? 9file))
	  (let ((str (string-append (cdr (f-t "9 file not found: "))
				    9file "\n")))
	    (display str)
	    (exit))
	  (let* ((port (open-input-file 9file))
		 (str (get-string-all port)))
	    (if (equal? str #!eof) " " str))))))
