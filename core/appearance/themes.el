;;; package --- Summary
;;; Commentary:
;;; configuration of themes for Emacs
;;; Configured for use on Linux, vc using git

;;; Code:

;; Default font should be Iosevka Nerd Font Light, 10pt
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font Light 10"))
(set-face-attribute 'default t :font "Iosevka Nerd Font Light 10")

(defun !my-set-theme (my-theme-to-load)
	"Set MY-THEME-TO-LOAD and the associated background settings"
	(mapcar #'disable-theme custom-enabled-themes)
	(load-theme my-theme-to-load t)
	(set-face-background 'fringe (face-attribute 'default :background))
	(set-face-background 'linum (face-attribute 'default :background))
	(spaceline-compile))

(use-package dracula-theme
	:ensure t)
(use-package cyberpunk-theme
	:ensure t)
(use-package moe-theme
	:ensure t)
(use-package eziam-theme
	:ensure t)
(use-package darktooth-theme
	:ensure t)
(use-package plan9-theme
	:ensure t)

;; Custom theme definitions. (spaceline-compile) is needed to get proper
;; powerline separators on theme-switch
(defun daytime-theme ()
	"Sets leuven theme for daytime and associated colors"
	(interactive)
	(!my-set-theme 'moe-light)
	(set-face-background 'auto-dim-other-buffers-face "#e0e0e0")
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun daytime-alt-theme ()
	"Sets leuven theme for daytime and associated colors"
	(interactive)
	(!my-set-theme 'plan9)
	(set-face-background 'auto-dim-other-buffers-face "#e0e0e0")
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun daytime-space-theme ()
	"Sets eziam-light theme for daytime and associated colors"
	(interactive)
	(!my-set-theme 'eziam-light)
	(set-face-background 'auto-dim-other-buffers-face "#e0e0e0")
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun night-theme ()
	"Sets dracula theme for nighttime and associated colors"
	(interactive)
	(!my-set-theme 'dracula)
	(set-face-background 'auto-dim-other-buffers-face "#303136")
	(set-face-background 'nlinum-relative-current-face "#000000"))

(defun night-alt-theme ()
	"Sets darktooth theme for nighttime and associated colors"
	(interactive)
	(!my-set-theme 'darktooth)
	(set-face-background 'auto-dim-other-buffers-face "#303136")
	(set-face-background 'nlinum-relative-current-face "#000000"))

(defun dark-night-theme ()
  "Sets cyberpunk theme for dark nightime usage"
  (interactive)
  (!my-set-theme 'cyberpunk)
	(set-face-background 'auto-dim-other-buffers-face "#212121")
	(set-face-background 'nlinum-relative-current-face "#000000"))

