;;; R-Tools -- Summary:
;;; Commentary:
;;; R language configuration for Emacs
;;; generated by Zach Maas

;;; Code:

;; Base setup for using R
(use-package ess
	:ensure t)

(use-package polymode
	:ensure t
	:config
	(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode)))

;; (use-package matlab-mode
	:ensure t
	:config
	(add-to-list
	 'auto-mode-alist
	 '("\\.m$" . matlab-mode))
	(setq matlab-indent-function t)
	(setq matlab-shell-command "matlab")
	;; (add-to-list 'company-backends 'company-matlab-shell))

(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'ess-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "ll" '(ess-eval-region-or-function-or-paragraph :which-key "eval region")
 "le" '(ess-eval-buffer :which-key "eval buffer")
 "lR" '(R :which-key "R"))

;;; r.el ends here
