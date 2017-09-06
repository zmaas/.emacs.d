;;; Emacs-Defaults -- Summary:
;;; Commentary:
;;;	Load any startup generic defaults
;;; generated by Zach Maas

;;; Code:



;; Save history of everything by default
(savehist-mode t)

;; Allow us to diminish packages with use-package
(require 'diminish)
(diminish 'auto-revert-mode)
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)

;; UTF8. PLEASE.
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))     ; I
(prefer-coding-system        'utf-8)   ; really
(set-terminal-coding-system  'utf-8)   ; really
(set-keyboard-coding-system  'utf-8)   ; really
(set-selection-coding-system 'utf-8)   ; really
(setq locale-coding-system   'utf-8)   ; want
(setq-default buffer-file-coding-system 'utf-8) ;	UTF-8

;; Set reasonable defaults for editing
(setq inhibit-startup-message t
			vc-follow-symlinks t
			word-wrap t
			;; Scroll Config
			hscroll-margin 1
			hscroll-step 1
			scroll-conservatively 1001
			scroll-margin 0
			scroll-preserve-screen-position t)
;; 80 columns, no UI elements  enabled
(setq-default fill-column 80)
(setq-default tab-width 2)
;; Disable annoying	UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Make font-lock work better in the background
(setq jit-lock-defer-time nil
      ;; jit-lock-stealth-nice 0.1
      jit-lock-stealth-time 1
      jit-lock-stealth-verbose nil
			idle-update-delay 2)
;; Simple little things
(defalias 'yes-or-no-p 'y-or-n-p)
(setq line-move-visual t)

;; Put automatic backups in the	homme folder
(setq backup-directory-alist '(("." . "~/.emacsbackups")))

;; Setup passwords using .authinfo
(setq auth-sources
			'((:source "~/.emacs.d/secrets/.authinfo.gpg")))

;; Prevents us from fat fingering and accidentally closing emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Reset gc-threshold after initialization is done
(add-hook 'emacs-startup-hook 'ono-set-gc-threshold)
(defun ono-set-gc-threshold ()
  "Reset `gc-cons-threshold' to its default value."
  (setq gc-cons-threshold 800000))
