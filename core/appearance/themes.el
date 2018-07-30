;;; package --- Summary
;;; Commentary:
;;; configuration of themes for Emacs
;;; Configured for use on Linux, vc using git

;;; Code:

;; Custom	hook for when themes are set
(defvar ono-after-theme-hook nil
  "Hook called after a theme is loaded.")

;; Default font should be Ioevka Nerd Font Light, 10pt
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font Light 11"))
(set-face-attribute 'default t :font "Iosevka Nerd Font Light 11")

(defun !ono-set-theme (theme-to-load)
	"Set THEME-TO-LOAD and the associated background settings."
	(mapc #'disable-theme custom-enabled-themes)
	(load-theme theme-to-load t)
	(set-face-background 'fringe (face-attribute 'default :background))
	;; (set-face-background 'linum (face-attribute 'default :background))
	(run-hooks 'ono-after-theme-hook)
	;; (doom-themes-org-config)
	;; (doom-themes-visual-bell-config)
	(powerline-reset))

(use-package tao-theme
	:ensure t)
;; (use-package cyberpunk-theme
;; 	:ensure t)
(use-package kaolin-themes
	:ensure t)
(use-package dracula-theme
	:ensure t)
;; (use-package challenger-deep-theme
;; 	:ensure t)
;; (use-package color-theme-sanityinc-solarized
;; 	:ensure t)
;; (use-package material-theme
;; 	:ensure t)
;; (use-package zerodark-theme
;; 	:ensure t)
;; (use-package leuven-theme
;; 	:ensure t)
;; (use-package eziam-theme
;; 	:ensure t)

;; Custom theme definitions. (spaceline-compile) is needed to get proper
;; powerline separators on theme-switch

(defun ono-day-theme ()
	"Set underwater theme for daytime and associated colors."
	(interactive)
	(!ono-set-theme 'kaolin-light))

(defun ono-plain-night-theme ()
  "Set tao-yin theme for dark nightime usage."
  (interactive)
  (!ono-set-theme 'tao-yin))

(defun ono-day-bright-theme ()
	"Set eziam-light theme for daytime and associated colors."
	(interactive)
	(!ono-set-theme 'tao-yang))

;; (defun ono-night-theme ()
;; 	"Set dracula theme for nighttime and associated colors."
;; 	(interactive)
;; 	(!ono-set-theme 'dracula)
;; 	)

(defun ono-dark-night-theme ()
  "Set cyberpunk theme for dark nightime usage."
  (interactive)
  (!ono-set-theme 'dracula))

;; themes.el ends here
