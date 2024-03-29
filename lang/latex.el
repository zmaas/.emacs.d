;;; configuration of LaTeX editing packages for emacs
;;; generated by Zach Maas

;;; Code:

;; config to use auctex and latex-preview-pane for LaTeX editing
;; Must have ghostscript and mupdf installed
(require 'cl)
(require 'latex)
(use-package tex
	:straight auctex
	:init
	(use-package company-math
		:disabled t
		:straight t
		:config
		(add-hook 'latex-mode-hook
							#'(lambda ()
									(add-to-list 'company-backends 'company-math-symbols-latex)
									(add-to-list 'company-backends 'company-math-symbols-unicode)
									(add-to-list 'company-backends 'company-latex-commands))))
	(use-package latex-preview-pane
		:disabled t
		:config
		(latex-preview-pane-enable))
	:config
	;; (TeX-source-correlate-mode)        ; activate forward/reverse search
	(TeX-PDF-mode)
	(add-to-list 'TeX-view-program-selection
							 '(output-pdf "Zathura"))
	;; Use pdf-tools to open PDF files
	(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
				TeX-source-correlate-start-server t)

	;; Update PDF buffers after successful LaTeX runs
	(add-hook 'TeX-after-compilation-finished-functions
						#'TeX-revert-document-buffer)
	(setq latex-run-command "pdflatex -synctex=1")
	(setq TeX-show-compilation nil)
	(add-hook 'LaTeX-mode-hook #'latex-math-mode))

(use-package reftex
	:config
	(add-hook 'LaTeX-mode-hook #'turn-on-reftex))

(use-package company-auctex
	:straight t
	:config
	(add-hook 'LaTeX-mode-hook #'company-auctex-init))

(use-package latex-pretty-symbols
	:straight t)

;; (use-package latex-extra
;; 	:straight t
;; 	:diminish latex-extra-mode
;; 	:config
;; 	(add-hook 'LaTeX-mode-hook (lambda () ('latex-extra-mode t))))

(use-package auctex-latexmk
	:straight t
	:config
	(auctex-latexmk-setup)
	(setq-default TeX-engine 'xetex)
	(setq auctex-latexmk-inherit-TeX-PDF-mode t))

(use-package doc-view
  :config
  (define-key doc-view-mode-map (kbd "j")
    #'doc-view-next-line-or-next-page)
  (define-key doc-view-mode-map (kbd "k")
    #'doc-view-previous-line-or-previous-page)
  ;; use 'q' to kill the buffer, not just hide it
  (define-key doc-view-mode-map (kbd "q")
    #'kill-this-buffer))

;; Much better viewing of PDF's in emacs
(use-package pdf-tools
  :straight t
	:config
	(pdf-tools-install)
	(setq-default pdf-view-display-size 'fit-page)
	(setq pdf-annot-activate-created-annotations t)
	(general-define-key
	 :states '(normal motion)
	 :keymaps 'pdf-view-mode-map
	 "h" 'pdf-view-previous-page
	 "j" 'pdf-view-next-line-or-next-page
	 "k" 'pdf-view-previous-line-or-previous-page
	 "l" 'pdf-view-next-page
	 "K" 'pdf-view-previous-page
	 "J" 'pdf-view-next-page
	 "g" 'pdf-view-first-page
	 "G" 'pdf-view-last-page
	 ;; alternatively
	 "g" 'image-bob
	 "G" 'image-eob
	 (kbd "C-o") 'pdf-history-backward
	 (kbd "C-i") 'pdf-history-forward
	 "m" 'pdf-view-position-to-register
	 "'" 'pdf-view-jump-to-register
	 "/" 'pdf-occur
	 ;; "o" 'pdf-outline
	 "f" 'pdf-links-action-perform
	 "b" 'pdf-view-midnight-minor-mode
	 "sm" 'pdf-view-set-slice-using-mouse
	 "sb" 'pdf-view-set-slice-from-bounding-box
	 "sr" 'pdf-view-reset-slice
	 ;; Annotations
	 "aD" 'pdf-annot-delete
	 "at" 'pdf-annot-attachment-dired
	 "ah" 'pdf-annot-add-highlight-markup-annotation
	 "al" 'pdf-annot-list-annotations
	 "am" 'pdf-annot-add-markup-annotation
	 "ao" 'pdf-annot-add-strikeout-markup-annotation
	 "as" 'pdf-annot-add-squiggly-markup-annotation
	 "at" 'pdf-annot-add-text-annotation
	 "au" 'pdf-annot-add-underline-markup-annotation
	 ;; Fit image to window
	 "z" '(:ignore t :which-key "zoom")
	 "zw" 'pdf-view-fit-width-to-window
	 "zh" 'pdf-view-fit-height-to-window
	 "zp" 'pdf-view-fit-page-to-window
	 ;; Other
	 "ss" 'pdf-occur
	 "p" 'pdf-misc-print-document
	 "O" 'pdf-outline))

(use-package ivy-bibtex
	:straight t
	:config
	(setq bibtex-completion-bibliography '("~/Downloads/synced/Zotero_Library.bib"))
	(setq ivy-bibtex-default-action 'ivy-bibtex-insert-key))

;; autocompletion for bibtex keys
(use-package company-bibtex
	:straight t
	:config
	(setq company-bibtex-bibliography '("~/Downloads/synced/Zotero_Library.bib"))
	(add-hook 'latex-mode-hook
						#'(lambda ()
								(add-to-list 'company-backends 'company-bibtex))))

(add-hook 'LaTeX-mode-hook
          (lambda()
						(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
						(setq TeX-command-default "LatexMk")
						(setq TeX-save-query nil)
						(setq TeX-show-compilation nil)))

;; special per-mode keybindings for LaTex Editing
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'LaTeX-mode-map
 "<C-return>" '(LaTeX-insert-item :which-key "insert"))
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'LaTeX-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "ll" '(TeX-command-run-all :which-key "comp/view")
 "lc" '(TeX-command-buffer :which-key "compile")
 "li" '(imenu-list :which-key "imenu")
 "lr" '(ono-insert-autocite :which-key "citation")
 "lj" '(LaTeX-insert-item :which-key "item")
 "le" '(LaTeX-environment :which-key "environment")
 "lh" '(TeX-insert-macro :which-key "macro help")
 "lv" '(TeX-view :which-key "view"))

;;; latex.el ends here
