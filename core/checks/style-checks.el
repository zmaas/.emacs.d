;;; Stylecheck-Tools -- Summary:
;;; Commentary:
;;; configuration of style checking and management packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; Enforce maximum line lengths in programming modes
(use-package column-enforce-mode
  :ensure t
  :diminish column-enforce-mode
  :config
  (add-hook 'prog-mode-hook 'column-enforce-mode))

;; amazing plugin - gives us perfect indentation automatically for code
(use-package aggressive-indent
  :ensure t
  :diminish aggressive-indent-mode
  :config
  (add-hook 'after-init-hook #'global-aggressive-indent-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode))

;; keeps our parentheses balanced and allows for easy manipulation
(use-package smartparens
  :ensure t
	:diminish smartparens-mode
  :init
	(use-package evil-cleverparens
	  :ensure t
		:diminish evil-cleverparens-mode
	  :config
		(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
		(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)
		(add-hook 'scheme-mode-hook #'evil-cleverparens-mode))
  :config
  (require 'smartparens-config)
  (add-hook 'after-init-hook 'smartparens-global-mode))

; intelligently cleanup whitespace on save
(use-package whitespace-cleanup-mode
  :ensure t
  :diminish whitespace-cleanup-mode
  :config
  (add-hook 'after-init-hook 'whitespace-cleanup-mode))

;;; zm-stylechecks.el ends here
