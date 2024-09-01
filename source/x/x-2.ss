;; Copyright (c) 2023 Xu Xin <sxuxin@protonmail.com>

(define x-2
  (lambda parameters
    (string-append "#+LATEX_COMPILER: xelatex\n"
		   "#+LATEX_HEADER: \\usepackage{xeCJK}\n"
		   "#+LATEX_HEADER: \\usepackage{fontspec}\n"
		   "#+LATEX_HEADER: \\setmainfont{Noto Sans}\n"
		   "#+LATEX_HEADER: \\setCJKmainfont{Noto Sans CJK SC}\n"
		   "#+LATEX_HEADER: \\usepackage{indentfirst}\n"
		   "#+OPTIONS: toc:nil\n"
		   "\n"
		   "Content here\n")))
