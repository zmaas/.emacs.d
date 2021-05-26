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
	;; (set-face-background 'fringe (face-attribute 'default :background))
	;; (set-face-background 'linum (face-attribute 'default :background))
	(run-hooks 'ono-after-theme-hook)
	;;(doom-themes-org-config)
	;;(doom-themes-visual-bell-config)
	)

;; (use-package tao-theme
;; 	:straight t)
;; (use-package cyberpunk-theme
;; 	:straight t)
;; (use-package kaolin-themes
;; 	:straight t)
(use-package dracula-theme
	:straight t)
(use-package doom-themes
	:straight t)

;; Custom theme definitions. (spaceline-compile) is needed to get proper
;; powerline separators on theme-switch

(defun ono-day-theme ()
	"Set underwater theme for daytime and associated colors."
	(interactive)
	(!ono-set-theme 'leuven))

(defun ono-plain-night-theme ()
  "Set tao-yin theme for dark nightime usage."
  (interactive)
  (!ono-set-theme 'tao-yin))

(defun ono-day-bright-theme ()
	"Set eziam-light theme for daytime and associated colors."
	(interactive)
	(!ono-set-theme 'tao-yang))

(defun ono-night-theme ()
	"Set dracula theme for nighttime and associated colors."
	(interactive)
	(!ono-set-theme 'cyberpunk)
	)

(defun ono-dark-night-theme ()
  "Set cyberpunk theme for dark nightime usage."
  (interactive)
  (!ono-set-theme 'doom-dracula))

;; themes.el ends here
