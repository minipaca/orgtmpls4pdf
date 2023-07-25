;; Copyright (c) 2023 Xu Xin <sxuxin@protonmail.com>

(define x-usage
  (lambda parameters
    (string-append
     "\n"
     "    " (cdr (f-t "Org templates for exporting to PDF")) "\n"
     "\n"
     (cdr (f-t "Usage:")) "\n"
     "\n"
     "    " (cdr (f-e "app-name")) " -x " (cdr (f-t "[command]")) "\n"
     "\n"
     (cdr (f-t "The [command]s are:")) "\n"
     "\n"
     "    " "version" "  " (cdr (f-t "print version")) "\n"
     "    " "usage" "    " (cdr (f-t "show usage")) "\n"
     "\n"
     "    " "0" "        " (cdr (f-t "show config content")) "\n"
     "\n"
     "    " "1" "        " (cdr (f-t "show the minimal template")) "\n"
     "    " "2" "        " (cdr (f-t "show the minimal CJK template")) "\n"
     "\n"
     "    " "9" "        " (cdr (f-t "show user-defined content")) "\n"
     )))
