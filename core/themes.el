;;; package --- Summary
;;; Commentary:
;;; configuration of themes for Emacs
;;; Configured for use on Linux, vc using git

;;; Code:

(use-package spacemacs-theme
	:ensure t)

(defun daytime-theme ()
	"Sets leuven theme for daytime and associated colors"
	(interactive)
	(mapcar #'disable-theme custom-enabled-themes)
	(load-theme 'leuven)
	(set-face-background 'auto-dim-other-buffers-face "#e0e0e0")
	(set-face-background 'fringe (face-attribute 'default :background))
	(set-face-background 'linum (face-attribute 'default :background))
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun daytime-space-theme ()
	"Sets leuven theme for daytime and associated colors"
	(interactive)
	(mapcar #'disable-theme custom-enabled-themes)
	(load-theme 'spacemacs-light)
	(set-face-background 'auto-dim-other-buffers-face "#e0e0e0")
	(set-face-background 'fringe (face-attribute 'default :background))
	(set-face-background 'linum (face-attribute 'default :background))
	(set-face-background 'nlinum-relative-current-face "#EEEEEE")
	(set-face-foreground 'nlinum-relative-current-face "#607D8B"))

(defun night-theme ()
	"Sets spacemacs-dark theme for nighttime and associated colors"
	(interactive)
	(mapcar #'disable-theme custom-enabled-themes)
	(load-theme 'spacemacs-dark)
	(set-face-background 'auto-dim-other-buffers-face "#303136")
	(set-face-background 'fringe (face-attribute 'default :background))
	(set-face-background 'nlinum (face-attribute 'default :background)))
