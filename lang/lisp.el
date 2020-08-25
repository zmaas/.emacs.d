;;; Lisp-Tools -- Summary:
;;; Commentary:
;; configuration of Lisp editing packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; Common Lisp Configuration

;; Require common lisp
;;(use-package cl)

;; Uses SLIME configured for sbcl
(use-package sly
	:straight t
	:init
	;; TODO Debug this?
	(use-package sly-macrostep
		:straight t)
	(use-package sly-quicklisp
		:straight t)
	(use-package sly-repl-ansi-color
		:straight t)
	:config
	(add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))
	(add-to-list 'auto-mode-alist '("\\.lsp\\'" . lisp-mode))
	;; (setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
	(setq inferior-lisp-program "ros run")
	(load (expand-file-name "~/.roswell/helper.el"))
	;; (add-hook 'sly-mode-hook (lambda () (company-flx-mode nil)))
	(setq sly-contribs '(sly-fancy sly-tramp sly-quicklisp sly-repl-ansi-color))
  (sly-setup '(sly-fancy sly-repl-ansi-color sly-tramp sly-quicklisp)))

;; Racket Configuration

;; Setup for racket/scheme
(use-package geiser
	:straight t
	:init
	;; (use-package quack
	;; 	:straight t)
	:config
	(add-hook 'scheme-mode-hook #'geiser-mode))

;; special per-mode keybindings for racket Editing
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'geiser-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "lr" '(run-racket :which-key "racket repl")
 "ll" '(geiser-eval-definition :which-key "eval def")
 "le" '(geiser-eval-buffer :which-key "eval buffer")
 "lj" '(geiser-insert-lambda :which-key "lambda"))

;; Emacs Lisp	Configuration
(use-package ielm)

(use-package eldoc
	:diminish	""
	:config
	(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
	(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
	(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode))

(use-package srefactor
	:straight t
	:init
	(use-package srefactor-lisp))

(use-package elisp-slime-nav
	:straight t
	:diminish	""
	:config
	(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
		(add-hook hook 'elisp-slime-nav-mode)))

;; special per-mode keybindings for	slime
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps '(sly-mode-map sly-mrepl-mode-map)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "lR" '(sly :which-key "start sly")
 "la" '(sly-apropos-all :which-key "apropos")
 "lr" '(sly-mrepl :which-key "mrepl")
 "ln" '(sly-mrepl-new :which-key "new mrepl")
 "ls" '(sly-stickers-dwim :which-key "sticker")
 "lS" '(sly-list-connections :which-key "connections")
 "lc" '(sly-mrepl-clear-repl :which-key "clear mrepl")
 "lC" '(sly-compile-file :which-key "compile file")
 "lq" '(sly-quit-lisp :which-key "quit mrepl")
 "lL" '(sly-eval-defun :which-key "eval def")
 "ll" '(sly-compile-defun :which-key "compile def")
 "le" '(sly-eval-buffer :which-key "eval buffer")
 "lE" '(sly-compile-and-load-file :which-key "compile and load buffer")
 "ld" '(sly-disassemble-symbol :which-key "disassemble"))

;;; zm-lisp-tools.el ends here
