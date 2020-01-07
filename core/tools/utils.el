;;; Emacs-Utilities -- Summary:
;;; Commentary:
;; configuration of utility packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; Currently a smorgasbord of random tools...

;; Enable abbrev-mode by default
(setq-default abbrev-mode t)
(setq save-abbrevs 'silently)
(read-abbrev-file "~/.emacs.d/ono_custom_abbrevs")
(diminish 'abbrev-mode)

;; Don't use bidirectional languages
(setq-default bidi-display-reordering nil)

;; Make re-builder use saner defaults
(require 're-builder)
(setq reb-re-syntax 'string)

;; Use firefox for opening webpages
(defun ono-browse-url-firefox (URL &optional NEW-WINDOW)
	"Open URL and use BSPWM to switch window. NEW-WINDOW provided for compatibility"
	(interactive "sURL: ")
	(browse-url-firefox URL)
	(shell-command "bspc desktop -f web"))
(setq browse-url-browser-function 'ono-browse-url-firefox) ; mozilla browser

;; Preliminary addition of quickrun to speed up development
(use-package quickrun
	:ensure t)

(use-package multi-compile
	:ensure t
	:config
	(setq compilation-scroll-output t)
	(setq multi-compile-alist '((rust-mode . (("rust-debug" . "cargo run")
																						("rust-release" . "cargo run --release")
																						("rust-test" . "cargo test")))
															(go-mode . (("go-run" . "go run")
																					("go-test" . "go test")
																					("go-vet" . "go vet")))
															(haskell-mode . (("stack-build" . "stack build")
																							 ("stack-test" . "stack test")))
															(c++-mode . (("make" . "make -j")
																					 ("clean" . "make -j clean")
																					 ("test" . "make -j test")))
															(python-mode . (("make" . "make -j")
																							("clean" . "make -j clean")
																							("test" . "make -j test"))))))

;; expands selected regions
(use-package expand-region
	:ensure t
	:defer t
	:commands er/expand-region
	:config
	(global-set-key (kbd "C-=") 'er/expand-region))

;; ws-butler - easy white space trimming
;; won't make commits messy, only touches edited lines
;; Disabling because it causes problems with org-mode
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

;; Finally,let's get a better delete command in here by default
(use-package hungry-delete
	:ensure t
	:diminish hungry-delete-mode
	:config
	(add-hook 'after-init-hook #'global-hungry-delete-mode))

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
	:defer t
	:init
  ;; disable company completion of *all* remote filenames, whether
  ;; connected or not -- fixes annoying latency
	(setq tramp-default-method "ssh")
	(setq ssh-explicit-args '("-ssh -X"))
	(defun company-files--connected-p (file)
		(not (file-remote-p file))))

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

;; perl-like regexes
(use-package pcre2el
	:ensure t
	:diminish ""
	:config
	(add-hook 'after-init-hook #'rxt-global-mode))

;; visual-regexp - gives us visual indication of regexps in the buffer as we make them
;; (use-package visual-regexp
;; 	:ensure t
;; 	:init
;; 	(use-package visual-regexp-steroids
;; 		:ensure t)
;; 	:config
;; 	(define-key global-map (kbd "C-c r") 'vr/replace)
;; 	(define-key global-map (kbd "C-c q") 'vr/query-replace))

(require 're-builder)
(setq reb-re-syntax 'string)

;; zap to char - lets us kill all text up to the next instance of a character
(use-package zzz-to-char
	:ensure t
	:defer t
	:commands zzz-to-char
	:config
	(global-set-key (kbd "M-z") #'zzz-to-char))

;; (use-package move-text
;; 	:ensure t
;; 	:config
;; 	(move-text-default-bindings))

;; use the arrowkeys to move buffers - need a better solution using VIM keybinds
(when (fboundp 'windmove-default-keybindings)
	(windmove-default-keybindings))

(use-package dumb-jump
	:ensure t
	:defer t
	:commands	(dumb-jump-go dumb-jump-quick-look)
	:config
	(setq dumb-jump-selector 'ivy))

(use-package ace-window
	:ensure t
	:defer t
	:commands ace-window)

;; unfill paragraph commands
(use-package unfill
	:ensure t)

;; writable grep, used with rgrep
(use-package wgrep
	:quelpa (wgrep :fetcher github :repo "mhayashi1120/Emacs-wgrep")
	:config
	(setq wgrep-auto-save-buffer t))

;; Smarter Autoformatting
(use-package format-all
	:ensure t)

;; small utility that improves sexp evaluation
;; (use-package eval-sexp-fu
;; 	:quelpa (eval-sexp-fu :fetcher github :repo "emacsmirror/eval-sexp-fu")
;; 	:config
;; 	(setq eval-sexp-fu-flash-duration 0.4)
;; 	(turn-on-eval-sexp-fu-flash-mode))

(use-package persistent-scratch
	:ensure t
	:diminish ""
	:config
	(persistent-scratch-setup-default))

(use-package esup
	:ensure t)

(use-package atomic-chrome
	:ensure t
	:config
	(atomic-chrome-start-server))

(use-package helpful
	:ensure t)

;; sometimes we forget keybinds - this gives us a reminder
(use-package which-key
	:ensure t
	:diminish which-key-mode
	:config
	(which-key-setup-side-window-right-bottom)
	(which-key-enable-god-mode-support)
	(setq which-key-idle-delay 0.5)
	(which-key-mode t))

;;; zm-utils.el ends here
