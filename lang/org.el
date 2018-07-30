;;; Org-Tools -- Summary:
;;; Commentary:
;;; Org-mode configuration for Emacs
 ;;; generated by Zach Maas

 ;;; Code:

(use-package org
	:ensure org-plus-contrib
	:init
	;; (add-hook 'org-mode-hook (lambda () (ws-butler-mode nil)))
	(add-hook 'org-mode-hook (lambda () (visual-fill-column-mode nil))))

;; Essential org-mode setup
(setq org-todo-keywords
			'((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
(setq org-completion-use-ido t)
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq bookmark-save-flag t)
(setq org-refile-allow-creating-parent-nodes 'confirm)

(setq org-agenda-files '("~/Dropbox/Org/"
												 "~/Dropbox/Org/deft/"))
(setq org-clock-idle-time 15)
(setq org-default-notes-file "~/Dropbox/Org/organizer.org")

;; Custom Capture Templates
(setq org-capture-templates
			'(("t" "Todo" entry (file+headline "~/Dropbox/Org/organizer.org" "Unfiled")
				 "* TODO  %?\n  %i\n  %a")))

;; Setup `org-babel' for emacs-lisp, gnuplot, latex and shell-script.
(org-babel-do-load-languages
 'org-babel-load-languages
 '((calc . t)
   (ditaa . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (latex . t)
   (octave .t)
   (C . t)
   (python . t)
   (R . t)
   (ruby . t)
	 (shell . t)))
(setq org-src-fontify-natively t)
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Better bindings for org-mode through evil.
(use-package evil-org
	:ensure t
	:config
	(add-hook 'org-mode-hook #'evil-org-mode))

;; Calendar settings
(use-package calfw
	:ensure t
	:init
	;; Still setting up
	(use-package calfw-org
		:ensure t)
	(use-package calfw-gcal
		:ensure t)
	(use-package org-gcal
		:ensure t
		:init)
	(load-file "~/.emacs.d/lang/org-private.el")
	(setq cfw:fchar-junction ?╋
				cfw:fchar-vertical-line ?┃
				cfw:fchar-horizontal-line ?━
				cfw:fchar-left-junction ?┣
				cfw:fchar-right-junction ?┫
				cfw:fchar-top-junction ?┯
				cfw:fchar-top-left-corner ?┏
				cfw:fchar-top-right-corner ?┓))

;; TODO	Consider other PDF viewer
(use-package org-ref
	:ensure t
	:config
	(setq reftex-default-bibliography '("~/Downloads/synced/Zotero_Library.bib"))
	(setq org-ref-bibliography-notes "~/Dropbox/Org/bibliography/notes.org"
				org-ref-default-bibliography '("~/Dropbox/Org/bibliography/references.bib")
				org-ref-pdf-directory "~/Dropbox/Org/bibliography/bibtex-pdfs/")
	(setq bibtex-completion-pdf-field "File"))

(use-package interleave
	:ensure t
	:config)

(use-package deft
	:ensure t
	:config
	(setq deft-extensions '("org" "md" "txt")
				deft-directory "~/Dropbox/Org/deft"
				deft-default-extension "org"
				deft-text-mode 'org-mode
				deft-use-filename-as-title t
				deft-use-filter-string-for-filename t
				deft-auto-save-interval 0))

(use-package org-pomodoro
  :ensure t
  :commands (org-pomodoro)
  :config
	(setq alert-user-configuration (quote ((((:category . "org-pomodoro")) libnotify nil)))))

(setq org-agenda-custom-commands
			'(("c" "Simple agenda view"
				 ((tags "PRIORITY=\"A\""
								((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
								 (org-agenda-overriding-header "High-priority unfinished tasks:")))
					(agenda "")
					(alltodo "")))))

(defun +org-init-ui ()
	;;"Configures default UI settings for orgmode"
	(setq-default
	 org-adapt-indentation nil
	 org-agenda-dim-blocked-tasks nil
	 org-agenda-inhibit-startup t
	 org-agenda-skip-unavailable-files nil
	 org-cycle-include-plain-lists t
	 org-cycle-separator-lines 1
	 org-fontify-done-headline t
	 org-fontify-quote-and-verse-blocks t
	 org-fontify-whole-heading-line t
	 org-footnote-auto-label 'plain
	 org-hidden-keywords nil
	 org-hide-emphasis-markers nil
	 org-hide-leading-stars t
	 org-hide-leading-stars-before-indent-mode t
	 org-image-actual-width nil
	 org-indent-indentation-per-level 2
	 org-indent-mode-turns-on-hiding-stars t
	 org-pretty-entities nil
	 org-pretty-entities-include-sub-superscripts t
	 org-startup-folded t
	 org-startup-indented t
	 org-startup-with-inline-images nil
	 org-tags-column 0
	 org-use-sub-superscripts '{}
	 outline-blank-line t
	 ;; Properly scale LaTeX previews
	 org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
	(defsubst +org--tag-face (n)
		(let ((kwd (match-string n)))
			(or (and (equal kwd "#") 'org-tag)
					(and (equal kwd "@") 'org-special-keyword))))
	(defun +org-init-custom-fontification ()
		"Correct (and improve) org-mode's font-lock keywords.
	1. Re-set `org-todo' & `org-headline-done' faces, to make them respect
		 underlying faces.
	2. Fontify item bullets
	3. Fontify item checkboxes (and when they're marked done)
	4. Fontify dividers/separators (5+ dashes)
	5. Fontify #hashtags and @at-tags, for personal convenience"
		(let ((org-todo (format org-heading-keyword-regexp-format
														org-todo-regexp))
					(org-done (format org-heading-keyword-regexp-format
														(concat "\\(?:" (mapconcat #'regexp-quote org-done-keywords "\\|") "\\)"))))
			(setq
			 org-font-lock-extra-keywords
			 (append (org-delete-all
								`(("\\[\\([0-9]*%\\)\\]\\|\\[\\([0-9]*\\)/\\([0-9]*\\)\\]"
									 (0 (org-get-checkbox-statistics-face) t))
									(,org-todo (2 (org-get-todo-face 2) t))
									(,org-done (2 'org-headline-done t)))
								org-font-lock-extra-keywords)
							 `((,org-todo (2 (org-get-todo-face 2) prepend))
								 (,org-done (2 'org-headline-done prepend))
								 ;; Make checkbox statistic cookies respect underlying faces
								 ("\\[\\([0-9]*%\\)\\]\\|\\[\\([0-9]*\\)/\\([0-9]*\\)\\]"
									(0 (org-get-checkbox-statistics-face) prepend))
								 ;; I like how org-mode fontifies checked TODOs and want this to extend to
								 ;; checked checkbox items:
								 ("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
									1 'org-headline-done prepend)
								 ;; make plain list bullets stand out
								 ("^ *\\([-+]\\|[0-9]+[).]\\) " 1 'org-list-dt append)
								 ;; and separators/dividers
								 ("^ *\\(-----+\\)$" 1 'org-meta-line)
								 ;; custom #hashtags & @at-tags for another level of organization
								 ("\\s-\\(\\([#@]\\)[^ \n.,]+\\)" 1 (+org--tag-face 2)))))))
	(add-hook 'org-font-lock-set-keywords-hook #'+org-init-custom-fontification))

(defun +org-init-olivetti ()
	"Initialize olivetti mode with proper width for orgmode buffers."
	(olivetti-set-width 100)
	(turn-on-olivetti-mode))

;; Call our UI function
(add-hook 'org-load-hook #'+org-init-ui)
(add-hook 'org-load-hook #'+org-init-olivetti)

;; Calls a special hydra for insertion if at the start of a line
(define-key org-mode-map "<"
	(lambda () (interactive)
		(if (looking-back "^")
				(hydra-org-template/body)
			(self-insert-command 1))))

(general-define-key
 :states '(normal visual insert emacs)
 :keymaps	'deft-mode-map
 "q" '(quit-window :which-key "quit")
 "n" '(deft-new-file :which-key "new")
 "s" '(deft-new-file-named :which-key "new-name")
 "a" '(deft-archive-file :which-key "archive")
 "r" '(deft-rename-file :which-key "rename")
 "f" '(deft-filter :which-key "filter")
 "c" '(deft-filter-clear :which-key "clear filter")
 "d" '(deft-delete-file :which-key "delete"))

(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "o" '(:ignore t :which-key "org")
 "oS" '(counsel-org-agenda-headlines :which-key "rifle")
 "oa" '(org-agenda :which-key "agenda")
 "oc" '(org-capture :which-key "capture")
 "oC" '(cfw:open-org-calendar :which-key "calendar")
 "oo" '(ono-open-organizer-file :which-key "organizer")
 "op" '(org-pomodoro :which-key "pomodoro")
 "oi" '(org-clock-in :which-key "clock in")
 "oO" '(org-clock-out :which-key "clock out")
 "ot" '(org-todo :which-key "todo")
 "of" '(helm-org-rifle :which-key "find")
 "om" '(org-mu4e-store-and-capture :which-key "capture message")
 "oT" '(counsel-org-tag :which-key "tag")
 "os" '(org-schedule :which-key "schedule")
 "od" '(org-deadline :which-key "deadline")
 "oe" '(org-export-dispatch :which-key "export")
 "ol" '(org-toggle-latex-fragment :which-key "latex")
 "oL" '(org-todo-list :which-key "deadline")
 "og" '(counsel-org-goto-all :which-key "goto")
 "or" '(org-refile :which-key "refile"))

;;; zm-org-tools.el ends here
