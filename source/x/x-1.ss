;; Copyright (c) 2023 Xu Xin <sxuxin@protonmail.com>

(define x-1
  (lambda parameters
    (string-append "#+LATEX_COMPILER: xelatex\n"
		   "#+LATEX_HEADER: \\usepackage{xeCJK}\n"
		   "#+OPTIONS: toc:nil\n"
		   "\n"
		   "Content here\n")))
