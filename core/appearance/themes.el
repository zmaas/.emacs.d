;;; package --- Summary
;;; Commentary:
;;; configuration of themes for Emacs
;;; Configured for use on Linux, vc using git

;;; Code:

;; Custom	hook for when themes are set
(defvar ono-after-theme-hook nil
  "Hook called after a theme is loaded.")

;; Default font should be Ioevka Nerd Font Light, 10pt
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font Light 10"))
(set-face-attribute 'default t :font "Iosevka Nerd Font Light 10")

(defun !ono-set-theme (theme-to-load)
	"Set THEME-TO-LOAD and the associated background settings."
	(mapc #'disable-theme custom-enabled-themes)
	(load-theme theme-to-load t)
	(set-face-background 'fringe (face-attribute 'default :background))
	(set-face-background 'linum (face-attribute 'default :background))
	(run-hooks 'ono-after-theme-hook)
	;; (doom-themes-org-config)
	;; (doom-themes-visual-bell-config)
	(powerline-reset))

(use-package dracula-theme
	:ensure t)
(use-package cyberpunk-theme
	:ensure t)
(use-package darktooth-theme
	:ensure t)
(use-package challenger-deep-theme
	:ensure t)
(use-package color-theme-sanityinc-solarized
	:ensure t)
(use-package material-theme
	:ensure t)
(use-package zerodark-theme
	:ensure t)
(use-package leuven-theme
	:ensure t)
(use-package eziam-theme
	:ensure t)

;; Custom theme definitions. (spaceline-compile) is needed to get proper
;; powerline separators on theme-switch
(defun ono-day-theme ()
	"Set material-light theme for daytime and associated colors."
	(interactive)
	(!ono-set-theme 'material-light)
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))


(defun ono-day-alt-theme ()
	"Set underwater theme for daytime and associated colors."
	(interactive)
	(!ono-set-theme 'challenger-deep)
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun ono-solarized-theme ()
	"Set leuven theme for daytime and associated colors."
	(interactive)
	(!ono-set-theme 'sanityinc-solarized-light)
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun ono-plain-night-theme ()
  "Set tao-yin theme for dark nightime usage."
  (interactive)
  (!ono-set-theme 'eziam-dark)
	(set-face-background 'nlinum-relative-current-face "#000000"))

(defun ono-day-bright-theme ()
	"Set eziam-light theme for daytime and associated colors."
	(interactive)
	(!ono-set-theme 'eziam-light)
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun ono-night-theme ()
	"Set dracula theme for nighttime and associated colors."
	(interactive)
	(!ono-set-theme 'dracula)
	(set-face-background 'nlinum-relative-current-face "#000000"))

(defun ono-night-alt-theme ()
	"Set darktooth theme for nighttime and associated colors."
	(interactive)
	(!ono-set-theme 'darktooth)
	(set-face-background 'nlinum-relative-current-face "#000000"))

(defun ono-tron-theme ()
	"Set tron theme for nighttime and associated colors."
	(interactive)
	(!ono-set-theme 'zerodark)
	(set-face-background 'nlinum-relative-current-face "#000000")
	(set-face-background 'mode-line-emphasis))

(defun ono-leuven-theme ()
	"Set tron theme for nighttime and associated colors."
	(interactive)
	(!ono-set-theme 'leuven)
	(set-face-background 'nlinum-relative-current-face "#000000")
	(set-face-background 'mode-line-emphasis))

(defun ono-dark-night-theme ()
  "Set cyberpunk theme for dark nightime usage."
  (interactive)
  (!ono-set-theme 'cyberpunk)
	(set-face-background 'nlinum-relative-current-face "#000000"))

;; themes.el ends here
