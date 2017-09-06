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
	(use-package imenu-anywhere
		:ensure t
		:commands ivy-imenu-anywhere)
	(use-package all-the-icons-ivy
		:ensure t
		:config
		(all-the-icons-ivy-setup))
  (use-package counsel-projectile
    :ensure t
		:config
		(counsel-projectile-on))
	(use-package counsel-dash
		:ensure t
		:config
		(setq counsel-dash-common-docsets '("Emacs Lisp" "Go" "Python 3" "C++"))
		(setq counsel-dash-docsets-path "~/.docsets")
		(setq counsel-dash-browser-func 'browse-url)
		(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
		(add-hook 'go-mode-hook (lambda () (setq-local counsel-dash-docsets '("Go"))))
		(add-hook 'c++-mode-hook (lambda () (setq-local counsel-dash-docsets '("C++"))))
		(add-hook 'python-mode-hook (lambda () (setq-local counsel-dash-docsets '("Python 3")))))
  :config
  (ivy-mode 1)
	(setq counsel-grep-base-command
				"rg -i -M 120 --no-heading --line-number --color never '%s' %s")
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
					(swiper-all . ivy--regex-plus)
					(counsel-yank-pop . ivy--regex-plus)
					(ivy-bibtex . ivy--regex-plus)
					(counsel-git-grep . ivy--regex-plus)
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
