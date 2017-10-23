;;; package --- Summary
;;; Commentary:
;;; configuration of themes for Emacs
;;; Configured for use on Linux, vc using git

;;; Code:

;; Custom	hook for when themes are set
(defvar ono-after-theme-hook nil
  "Hook called after a theme is loaded")

;; Default font should be Ioevka Nerd Font Light, 10pt
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font Light 10"))
(set-face-attribute 'default t :font "Iosevka Nerd Font Light 10")

(defun !ono-set-theme (theme-to-load)
	"Set THEME-TO-LOAD and the associated background settings"
	(mapcar #'disable-theme custom-enabled-themes)
	(load-theme theme-to-load t)
	(set-face-background 'fringe (face-attribute 'default :background))
	(set-face-background 'linum (face-attribute 'default :background))
	(run-hooks 'ono-after-theme-hook)
	(powerline-reset))

(use-package dracula-theme
	:ensure t)
(use-package cyberpunk-theme
	:ensure t)
(use-package gotham-theme
	:ensure t)
(use-package moe-theme
	:ensure t)
(use-package tao-theme
	:ensure t)
(use-package spacemacs-theme
	:ensure t)
(use-package darktooth-theme
	:ensure t)
(use-package challenger-deep-theme
	:ensure t)
(use-package color-theme-sanityinc-solarized
	:ensure t)

;; Custom theme definitions. (spaceline-compile) is needed to get proper
;; powerline separators on theme-switch
(defun ono-day-theme ()
	"Sets moe-light theme for daytime and associated colors"
	(interactive)
	(!ono-set-theme 'spacemacs-light)
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun ono-day-alt-theme ()
	"Sets underwater theme for daytime and associated colors"
	(interactive)
	(!ono-set-theme 'challenger-deep)
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun ono-solarized-theme ()
	"Sets leuven theme for daytime and associated colors"
	(interactive)
	(!ono-set-theme 'sanityinc-solarized-light)
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun ono-day-bright-theme ()
	"Sets eziam-light theme for daytime and associated colors"
	(interactive)
	(!ono-set-theme 'tao-yang)
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun ono-night-theme ()
	"Sets dracula theme for nighttime and associated colors"
	(interactive)
	(!ono-set-theme 'dracula)
	(set-face-background 'nlinum-relative-current-face "#000000"))

(defun ono-night-alt-theme ()
	"Sets darktooth theme for nighttime and associated colors"
	(interactive)
	(!ono-set-theme 'darktooth)
	(set-face-background 'nlinum-relative-current-face "#000000"))

(defun ono-tron-theme ()
	"Sets tron theme for nighttime and associated colors"
	(interactive)
	(!ono-set-theme 'gotham)
	(set-face-background 'nlinum-relative-current-face "#000000")
	(set-face-background 'mode-line-emphasis))

(defun dark-night-theme ()
  "Sets cyberpunk theme for dark nightime usage"
  (interactive)
  (!ono-set-theme 'cyberpunk)
	(set-face-background 'nlinum-relative-current-face "#000000"))
