;;; configuration of LaTeX editing packages for emacs
;;; generated by Zach Maas

;;; Code:

;; config to use auctex and latex-preview-pane for LaTeX editing
;; Must have ghostscript and mupdf installed
(require 'latex)
(use-package tex-site
	:ensure auctex
	:init
	(use-package company-math
		:ensure t
		:config
    (add-to-list 'company-backends 'company-math-symbols-latex)
		(add-to-list 'company-backends 'company-latex-commands))
	(use-package latex-preview-pane
		:ensure t
		:config
		(latex-preview-pane-enable))
	:config
	(add-to-list 'TeX-view-program-selection
							 '(output-pdf "Zathura"))
	(setq latex-run-command "pdflatex -synctex=1")
	(setq TeX-show-compilation nil))

(use-package auctex-latexmk
	:ensure t
	:config
	(auctex-latexmk-setup)
	(setq auctex-latexmk-inherit-TeX-PDF-mode t))

(use-package ivy-bibtex
	:ensure t
	:config
	(setq bibtex-completion-bibliography '("~/Downloads/synced/Zotero_Library.bib")))

;; autocompletion for bibtex keys
(use-package company-bibtex
	:ensure t
	:config
	(setq company-bibtex-bibliography '("~/Downloads/synced/Zotero_Library.bib"))
	(add-to-list 'company-backends 'company-bibtex))

(add-hook 'LaTeX-mode-hook
          (lambda()
						(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
						(setq TeX-command-default "XeLaTeX")
						(setq TeX-save-query nil)
						(setq TeX-show-compilation t)))