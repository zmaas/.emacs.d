;;; package --- Summary
;;; Commentary:
;;; configuration of themes for Emacs
;;; Configured for use on Linux, vc using git

;;; Code:

(defun !my-set-theme (my-theme-to-load)
	"Set MY-THEME-TO-LOAD and the associated background settings"
	(mapcar #'disable-theme custom-enabled-themes)
	(load-theme my-theme-to-load t)
	(set-face-background 'fringe (face-attribute 'default :background))
	(set-face-background 'linum (face-attribute 'default :background))
	(spaceline-compile))

(use-package spacemacs-theme
	:ensure t)
(use-package cyberpunk-theme
	:ensure t)

;; Custom theme definitions. (spaceline-compile) is needed to get proper
;; powerline separators on theme-switch
(defun daytime-theme ()
	"Sets leuven theme for daytime and associated colors"
	(interactive)
	(!my-set-theme 'leuven)
	(set-face-background 'auto-dim-other-buffers-face "#e0e0e0")
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun daytime-space-theme ()
	"Sets spaceline-light theme for daytime and associated colors"
	(interactive)
	(!my-set-theme 'spacemacs-light)
	(set-face-background 'auto-dim-other-buffers-face "#e0e0e0")
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun night-theme ()
	"Sets spacemacs-dark theme for nighttime and associated colors"
	(interactive)
	(!my-set-theme 'spacemacs-dark)
	(set-face-background 'auto-dim-other-buffers-face "#303136")
	(set-face-background 'nlinum-relative-current-face "#000000"))

(defun dark-night-theme ()
  "Sets cyberpunk theme for dark nightime usage"
  (interactive)
  (!my-set-theme 'cyberpunk)
	(set-face-background 'auto-dim-other-buffers-face "#303136")
	(set-face-background 'nlinum-relative-current-face "#000000"))

