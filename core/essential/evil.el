;;; Evil-Tools -- Summary:
;;; Commentary:
;;; evil mode configuration for Emacs
;;; generated by Zach Maas

;;; Code:

;; Configure evil mode and its packages - VIM like performance
(use-package evil
	:straight t
	:init
  (setq evil-want-integration t)
	(setq evil-want-keybinding nil)
	;; anzu tells us how many matches we have in the bar
	(use-package anzu
		:straight t
		:diminish anzu-mode
		:config
		(global-anzu-mode 1))
	;; compatibility with evil mode for anzu
	(use-package evil-anzu
		:straight t)
	;; lets use use avy with evil for jumping around easily
	(use-package evil-escape
		:straight t
		:diminish evil-escape-mode
		:config
		(evil-escape-mode t)
		(setq-default evil-escape-key-sequence "jk"))
	;; improved code folding - like vim
	(use-package evil-vimish-fold
		:ensure	vimish-fold
		:diminish ""
		:straight t
		:config
		(evil-vimish-fold-mode t))
	(use-package evil-snipe
		:straight t
		:diminish evil-snipe-mode
		:diminish evil-snipe-override-mode
		:diminish evil-snipe-local-mode
		:config
		(evil-snipe-override-mode 1)
		(setq evil-snipe-scope 'whole-visible
					evil-snipe-spillover-scope 'whole-buffer
					evil-snipe-auto-scroll 'nil))
	(use-package evil-surround
		:straight t
		:init
		(use-package evil-embrace
			:straight t
			:config
			(evil-embrace-enable-evil-surround-integration)
			(add-hook 'LaTeX-mode-hook #'embrace-LaTeX-mode-hook)
			(add-hook 'org-mode-hook #'embrace-org-mode-hook))
		:config
		(global-evil-surround-mode 1))
	(use-package evil-commentary
		:straight t
		:diminish ""
		:config
		(evil-commentary-mode))
	(setq evil-snipe-scope 'visible)
	(use-package evil-exchange
		:straight t
		:config
		(evil-exchange-install))
	(use-package evil-visualstar
		:straight t
		:config
		(global-evil-visualstar-mode))
	(use-package evil-numbers
		:straight t)
	(use-package evil-matchit
		:straight t
		:config
		(global-evil-matchit-mode 1))
	(use-package evil-args
		:straight t
		:config
		;; bind evil-args text objects
		(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
		(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
		;; bind evil-forward/backward-args
		(define-key evil-normal-state-map "L" 'evil-forward-arg)
		(define-key evil-normal-state-map "H" 'evil-backward-arg)
		(define-key evil-motion-state-map "L" 'evil-forward-arg)
		(define-key evil-motion-state-map "H" 'evil-backward-arg)
		;; bind evil-jump-out-args
		(define-key evil-normal-state-map "K" 'evil-jump-out-args))
	(use-package evil-indent-plus
		:straight t
		:config
		(define-key evil-inner-text-objects-map "i" 'evil-indent-plus-i-indent)
		(define-key evil-outer-text-objects-map "i" 'evil-indent-plus-a-indent)
		(define-key evil-inner-text-objects-map "I" 'evil-indent-plus-i-indent-up)
		(define-key evil-outer-text-objects-map "I" 'evil-indent-plus-a-indent-up)
		(define-key evil-inner-text-objects-map "J" 'evil-indent-plus-i-indent-up-down)
		(define-key evil-outer-text-objects-map "J" 'evil-indent-plus-a-indent-up-down))
	(use-package evil-lion
		:straight t
		:config
		(evil-lion-mode))
	(use-package evil-unimpaired
		:straight (evil-unimpaired :host github :repo "zmaas/evil-unimpaired")
		:config
		(evil-unimpaired-mode 1)
		(evil-unimpaired-define-pair "q" '(flycheck-previous-error . flycheck-next-error))
		(setq evil-unimpaired-leader-keys '("[" . "]")))

	(use-package evil-goggles
		:straight t
		:diminish evil-goggles-mode
		:config
		(add-hook 'after-init-hook #'evil-goggles-mode))
	(use-package evil-search-highlight-persist
		:straight t
		:diminish ""
		:config
		(global-evil-search-highlight-persist t)
		(setq evil-search-highlight-string-min-len 3))
	(use-package evil-easymotion
		:straight t
		:config
		(evilem-default-keybindings "gs"))
	(use-package evil-rsi
		:straight t
		:diminish ""
		:config
		(add-hook 'after-init-hook #'evil-rsi-mode))
	(use-package evil-multiedit
		:straight t
		:config
		(setq evil-multiedit-scope 'buffer
					evil-multiedit-follow-matches t))
	(use-package evil-lispy
		:straight t)
	(use-package evil-collection
		:after evil
		:straight t
		:init
		(evil-collection-init)
		:config
		(setq evil-collection-setup-minibuffer t
					evil-collection-company-use-tng t
					evil-collection-term-sync-state-function t))
	:config
	(evil-mode 1)
	(setq evil-want-C-u-scroll t
        evil-want-visual-char-semi-exclusive t
        evil-want-Y-yank-to-eol t
        evil-magic t
        evil-search-module 'evil-search	;; Must also set manually for	gn
        evil-echo-state t
        evil-indent-convert-tabs t
        evil-ex-search-vim-style-regexp t
        evil-ex-substitute-global t
        evil-ex-visual-char-range t  ; column range for ex commands
        evil-insert-skip-empty-lines t
        evil-mode-line-format 'nil
        ;; more vim-like behavior
        evil-symbol-word-search t
				evil-want-fine-undo 'fine
        ;; don't activate mark on shift-click
				shift-select-mode nil)
	(evil-select-search-module 'evil-search-modu 'evil-search))

(use-package god-mode
	:straight t
	:init
	(use-package evil-god-state
		:straight t))

(defhydra hydra-expand-region ()
	"region: "
	("k" er/expand-region "expand")
	("j" er/contract-region "contract"))

(evil-define-key 'visual 'global (kbd "v") #'hydra-expand-region/body)

;;; zm-evil.el ends here
