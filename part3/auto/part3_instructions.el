(TeX-add-style-hook "part3_instructions"
 (lambda ()
    (LaTeX-add-labels
     "sec-1"
     "sec-2")
    (TeX-add-symbols
     '("alert" 1))
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
     "11pt")))

