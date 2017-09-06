;;; Emacs-Utilities -- Summary:
;;; Commentary:
;; configuration of utility packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; Currently a smorgasbord of random tools...

;; Don't use bidirectional languages
(setq-default bidi-display-reordering nil)

;; Make re-builder use saner defaults
(require 're-builder)
(setq reb-re-syntax 'string)

;; Use eww for opening webpages
(setq browse-url-browser-function 'eww-browse-url)

;; Preliminary addition of quickrun to speed up development
(use-package quickrun
	:ensure t)

(use-package multi-compile
	:ensure t
	:config
	(setq multi-compile-alist '((rust-mode . (("rust-debug" . "cargo run")
																						("rust-release" . "cargo run --release")
																						("rust-test" . "cargo test")))
															(go-mode . (("go-run" . "go run")
																					("go-test" . "go test")
																					("go-vet" . "go vet")))
															(c++-mode . (("make" . "make")
																					 ("clean" . "make clean")
																					 ("test" . "make test"))))))

;; expands selected regions
(use-package expand-region
	:ensure t
	:defer t
	:commands er/expand-region
	:config
	(global-set-key (kbd "C-=") 'er/expand-region))

;; ws-butler - easy white space trimming
;; won't make commits messy, only touches edited lines
(use-package ws-butler
	:ensure t
	:diminish ws-butler-mode
	:config
	(add-hook 'prog-mode-hook #'ws-butler-mode))

;; Speaking of whitespace, let's improve the builtin
;; just-one-space command
(use-package shrink-whitespace
  :ensure t
	:defer t
	:commands shrink-whitespace
  :bind ("M-SPC" . shrink-whitespace))

;; clipmon - add system clipboard contents to kill ring
(use-package clipmon
	:ensure t
	:diminish clipmon-mode
	:config
	(add-hook 'after-init-hook #'clipmon-mode)
	(add-to-list 'savehist-additional-variables
							 'kill-ring)
	(savehist-mode t))

;; get rid of kill ring dupes
(setq kill-do-not-save-duplicates t)

;; tramp - for remote file access
(use-package tramp
	:ensure t
	:defer t)

;; Very Large File Support
(use-package vlf-setup
  :ensure vlf
	:defer t)

;; Clunky way to do sudoedit on linux - bound to C-x C-r
(defun sudo-edit (&optional arg)
	(interactive "P")
	(if (or arg (not buffer-file-name))
			(find-file (concat "/sudo:root@localhost:"
												 (ido-read-file-name "Find file(as root): ")))
		(find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(global-set-key (kbd "C-x C-r") 'sudo-edit)

;; visual-regexp - gives us visual indication of regexps in the buffer as we make them
(use-package visual-regexp
	:ensure t
	:config
	(define-key global-map (kbd "C-c r") 'vr/replace)
	(define-key global-map (kbd "C-c q") 'vr/query-replace))

(require 're-builder)
(setq reb-re-syntax 'string)

;; go to characters quickly and easily
(global-set-key (kbd "C-;") 'avy-goto-char)

;; zap to char - lets us kill all text up to the next instance of a character
(use-package zzz-to-char
	:ensure t
	:defer t
	:commands zzz-to-char
	:config
	(global-set-key (kbd "M-z") #'zzz-to-char))

;; use the arrowkeys to move buffers - need a better solution using VIM keybinds
(when (fboundp 'windmove-default-keybindings)
	(windmove-default-keybindings))

(use-package dumb-jump
	:ensure t
	:defer t
	:commands dumb-jump-go)

(use-package ace-window
	:ensure t
	:defer t
	:commands ace-window)

(use-package esup
	:ensure t)

;; sometimes we forget keybinds - this gives us a reminder
(use-package which-key
	:ensure t
	:diminish which-key-mode
	:config
	(which-key-setup-side-window-bottom)
	(setq which-key-idle-delay 0.5)
	(which-key-mode t))

;;; zm-utils.el ends here
