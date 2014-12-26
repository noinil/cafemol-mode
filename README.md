cafemol-mode
============

An Emacs major mode for editing CafeMol input file.

## Usage:
```elisp
(add-to-list 'load-path "~/path_to_cafemol-mode/")
(require 'cafemol-mode)
(add-to-list 'auto-mode-alist '("\\.inp\\'" . cafemol-mode))
```

## Features:
- [X] provide a major mode for CafeMol input files
- [X] key words highlighting
- [X] comment (`*`) recognition;  use `Alt`+`;` to comment out selected region
- [ ] indentation
- [ ] section fold
- [ ] snippet
- [ ] abbreviations
- [ ] other...

## Commentary
This file is derived from *Emacs DerivedMode*:
http://www.emacswiki.org/emacs/DerivedMode

As for syntax highlighting, the codes are modified from Xah Lee's tutorial
(*ergoemacs*): http://ergoemacs.org/emacs/elisp_syntax_coloring.html
