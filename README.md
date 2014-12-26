cafemol-mode
============

An Emacs major mode for editing CafeMol input file.

## Usage:
```
(add-to-list 'load-path "~/path_to_cafemol-mode/")
(require 'cafemol-mode)
(add-to-list 'auto-mode-alist '("\\.inp\\'" . cafemol-mode))
```

## Features:
1. provide a major mode for CafeMol
2. key word highlighting
3. comment recognition;  use alt+; to comment out selected region

## TODO:
1. indentation
2. section fold
3. snippet
4. abbreviations
5. other...

## Commentory
This file is derived from *Emacs DerivedMode*:
http://www.emacswiki.org/emacs/DerivedMode
And for Syntax highlighting, the codes are modified from Xah Lee's *ergoemacs*:
http://ergoemacs.org/emacs/elisp_syntax_coloring.html
