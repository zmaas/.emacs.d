;;; Haskell-Tools -- Summary:
;;; Commentary:
;; configuration of haskell editing packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; General haskell mode
(use-package haskell-mode
	:ensure t
	:config
	(setq haskell-font-lock-symbols t))

(use-package intero
	:ensure t
	:config
	(add-hook 'after-init-hook #'intero-global-mode))

;;; haskell.el ends here
