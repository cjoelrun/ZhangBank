(TeX-add-style-hook "part1"
 (lambda ()
    (LaTeX-add-labels
     "sec-1"
     "sec-2"
     "sec-2-1"
     "sec-2-2"
     "sec-2-3"
     "sec-2-4"
     "sec-2-5"
     "sec-3")
    (TeX-add-symbols
     '("alert" 1)
     "HRule")
    (TeX-run-style-hooks
     "minted"
     "hyperref"
     "amssymb"
     "latexsym"
     "wasysym"
     "marvosym"
     "textcomp"
     "soul"
     "wrapfig"
     "float"
     "longtable"
     "graphicx"
     "fixltx2e"
     "fontenc"
     "T1"
     "inputenc"
     "utf8"
     "latex2e"
     "art11"
     "article"
     "11pt"
     "Title")))

