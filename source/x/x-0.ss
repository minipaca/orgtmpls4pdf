;; Copyright (c) 2023 Xu Xin <sxuxin@protonmail.com>

(define x-0
  (lambda parameters
    (string-append
     "\n"
     "  " (cdr (f-t "Config:")) " " (cdr (f-e "app-config-path")) "\n"
     "\n"
     "* Description" "\n"
     "\n"
     (cdr (f-t "  This software provides Org templates for exporting to PDF.\n  For converting the Org file into PDF file,\n  you need LaTex and Emacs installed on your computer.")) "\n"
     "\n"
     (cdr (f-t "* Emacs and LaTex installation")) "\n"
     "\n"
     (cdr (f-t "  Installing Emacs and LaTex is easy for most distros,\n  but what I want to say is how to choose LaTex packages.\n  I recommend installing ALL LaTex packages.\n  The advantages are obviouse:\n  It's easy to choose; It has less problems to use. \n  The disadvantages are obviouse too:\n  It needs time to download and install; It takes much more disk space.\n  I think the advantages far exceed the disadvantages.")) "\n"
     "\n"
     "* 9" "\n"
     "\n"
     (cdr (f-t "  9 or 9 file is simply a text file in which user write things,\n  And then user get it by invoking '-x 9'.\n  The location of 9 file is defined in the config file.")) "\n"
     )))
