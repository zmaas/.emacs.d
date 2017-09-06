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

(use-package company-auctex
	:ensure t
	:config
	(add-hook 'LaTeX-mode-hook #'company-auctex-init))

(use-package latex-extra
	:ensure t
	:diminish latex-extra-mode
	:config
	(add-hook 'LaTeX-mode-hook (lambda () ('latex-extra-mode t))))

(use-package auctex-latexmk
	:ensure t
	:config
	(auctex-latexmk-setup)
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
  :ensure t
  :when window-system
  :init (pdf-tools-install t t t)
	:config
	(general-define-key
	 :states '(normal)
	 :keymaps 'pdf-view-mode-map
	 "h" 'pdf-view-previous-page-command
	 "j" (lambda () (interactive) (pdf-view-next-line-or-next-page 5))
	 "k" (lambda () (interactive) (pdf-view-previous-line-or-previous-page 5))
	 "l" 'pdf-view-next-page-command
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
	 "o" 'pdf-outline
	 "f" 'pdf-links-action-perform
	 "b" 'pdf-view-midnight-minor-mode))

(use-package ivy-bibtex
	:ensure t
	:config
	(setq bibtex-completion-bibliography '("~/Downloads/synced/Zotero_Library.bib"))
	(setq ivy-bibtex-default-action 'ivy-bibtex-insert-key))

;; autocompletion for bibtex keys
(use-package company-bibtex
	:ensure t
	:config
	(setq company-bibtex-bibliography '("~/Downloads/synced/Zotero_Library.bib"))
	(add-to-list 'company-backends 'company-bibtex))

(add-hook 'LaTeX-mode-hook
          (lambda()
						(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
						(setq TeX-command-default "LatexMk")
						(setq TeX-save-query nil)
						(setq TeX-show-compilation t)))

;; special per-mode keybindings for LaTex Editing
(general-define-key
	 :states '(normal visual insert emacs)
   :keymaps 'LaTeX-mode-map
	 :prefix "SPC"
	 :non-normal-prefix "M-SPC"
	  "l" '(:ignore t :which-key "layer")
		"ll" '(TeX-command-run-all :which-key "comp/view")
		"lc" '(TeX-command-buffer :which-key "compile")
		"lj" '(LaTeX-insert-item :which-key "item")
		"lv" '(TeX-view :which-key "view"))
