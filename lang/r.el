;;; R-Tools -- Summary:
;;; Commentary:
;;; R language configuration for Emacs
;;; generated by Zach Maas

;;; Code:
(use-package ess
	:ensure t
	:config
	(add-hook R-mode-hook 'ess-r-mode))

;; r-mode.el ends here