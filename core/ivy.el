;;; Ivy Configuration -- Summary:
;;; Commentary:
;;; ivy configuration for Emacs
;;; generated by Zach Maas

;; IVY - preliminary configuration coming from helm-mode, Not yet active

;;; Code:

(use-package ivy
  :ensure t
	:diminish ivy-mode
	:diminish counsel-mode
  :init
	(use-package ivy-hydra
		:ensure t)
	(use-package smex
		:ensure t)
	(use-package flx
		:ensure t)
  (use-package counsel-projectile
    :ensure t
		:config
		(counsel-projectile-on))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
	(setq ivy-display-style 'fancy)
	(setq ivy-count-format "(%d/%d) ")
	(setq confirm-nonexistent-file-or-buffer t)
  (setq ivy-height 10)
  ;; Setup fuzzy matching using flx for ivy
  (use-package flx
    :ensure t)
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
					(t . ivy--regex-fuzzy)))
	(setq ivy-initial-inputs-alist nil)
  ;; rebind some ivy functions to be more sensible
	(set-variable 'ivy-ag-base-command "ag --nocolor --nogroup --ignore-case --hidden")
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)
	(define-key ivy-minibuffer-map (kbd "<escape>") 'hydra-ivy/body)
  ;; key bindings for ivy
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "M-i") 'swiper)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate))

;;; zm-ivy ends here