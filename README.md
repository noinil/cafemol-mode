cafemol-mode
============

An Emacs major mode for editing CafeMol input file.

## Usage:
To use this mode for writing or editing CafeMol input file, add the following to
your Emacs configuration file:
```elisp
(add-to-list 'load-path "~/path_to_cafemol-mode/")
(require 'cafemol-mode)
(add-to-list 'auto-mode-alist '("\\.inp\\'" . cafemol-mode))
```

To use the snippets, please try this: https://github.com/noinil/esnippets

## Features:
- [X] provide a major mode for CafeMol input files
- [X] key words highlighting
- [X] comment (`*`) recognition;  use `Alt`+`;` to comment out selected region
- [ ] indentation
- [ ] section fold
- [X] snippet
- [ ] other...

## Commentary
This file is derived from *Emacs DerivedMode*:
http://www.emacswiki.org/emacs/DerivedMode

As for syntax highlighting, the codes are modified from Xah Lee's tutorial
(*ergoemacs*): http://ergoemacs.org/emacs/elisp_syntax_coloring.html
