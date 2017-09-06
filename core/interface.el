;;; Interface Configuration -- Summary:
;;; Commentary:
;;; configuration of appearance packages for Emacs
;;; targeting interface configuration
;;; generated by Zach Maas

;;; Code:

;; Spaceline, a better modeline
(use-package spaceline-config
  :ensure spaceline
	:init
	(setq powerline-height 40
				powerline-raw " "
				ns-use-srgb-colorspace nil
				powerline-default-separator 'slant)
  :config
  (spaceline-emacs-theme)
	(spaceline-toggle-anzu-on)
	(spaceline-toggle-window-number-on)
  (setq anzu-cons-mode-line-p nil
				spaceline-workspace-numbers-unicode t
				spaceline-window-numbers-unicode t
				spaceline-highlight-face-func 'spaceline-highlight-face-evil-state))

;; tiny system monitor, helpful when we spend all of our time here
(use-package symon
	:ensure t
	:config
	(add-hook 'after-init-hook 'symon-mode))

;; Nice dashboard for our first startup
(use-package dashboard
	:ensure t
	:config
	(dashboard-setup-startup-hook)
	(setq dashboard-banner-logo-title "Welcome back, kid."
				dashboard-startup-banner 'logo
				dashboard-items '((recents  . 5)
													(bookmarks . 5)
													(projects . 5)
													(agenda . 5))))

;; Highlight git diffs in the	fringe
(use-package git-gutter-fringe
	:ensure t
	:diminish git-gutter-mode
	:config
	(add-hook 'after-init-hook 'global-git-gutter-mode)
	(setq-default fringes-outside-margins t)
	(setq git-gutter-fr:side 'left-fringe)
	;; thin fringe bitmaps
	(fringe-helper-define 'git-gutter-fr:added '(center repeated)
		"XXX.....")
	(fringe-helper-define 'git-gutter-fr:modified '(center repeated)
		"XXX.....")
	(fringe-helper-define 'git-gutter-fr:deleted 'bottom
		"X......."
		"XX......"
		"XXX....."
		"XXXX...."))

;; Tilde fringes, like vim
(use-package vi-tilde-fringe
	:ensure t
	:diminish global-vi-tilde-fringe-mode vi-tilde-fringe-mode
	:config
	(add-hook 'after-init-hook 'global-vi-tilde-fringe-mode))

;; relative line numbers, makes it much easier to use evil features
(use-package nlinum-relative
	:ensure t
	:diminish nlinum-relative-mode
	:config
	(add-hook 'after-init-hook #'global-nlinum-relative-mode))


;; Don't use external dialog boxes
(setq use-dialog-box nil
			;;  Highlight keystrokes in	minibuffer
			echo-keystrokes 0.02)

;; Show current line
(use-package hl-line
	:config
	(add-hook 'after-init-hook #'global-hl-line-mode)
	;; Don't highlight inactive buffers
	(setq hl-line-sticky-flag nil
				global-hl-line-sticky-flag nil))

;; make builtin popup menus use ace instead of the builtin option
(use-package ace-popup-menu
	:ensure t
	:diminish ace-popup-menu-mode
	:config
	(add-hook 'after-init-hook #'ace-popup-menu-mode))

;; automatically dim other buffers
(use-package auto-dim-other-buffers
	:ensure t
	:diminish auto-dim-other-buffers-mode
	:config
	(add-hook 'after-init-hook #'auto-dim-other-buffers-mode))

;; interface.el ends here
