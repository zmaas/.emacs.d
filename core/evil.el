;;; Evil-Tools -- Summary:
;;; Commentary:
;;; evil and god mode configuration for Emacs
;;; generated by Zach Maas

;;; Code:

;; Configure evil mode and its packages - VIM like performance
(use-package evil
	:ensure t
	:init
	;; anzu tells us how many matches we have in the bar
	(use-package anzu
		:ensure t
		:defer t
		:diminish anzu-mode
		:config
		(global-anzu-mode 1))
	;; compatibility with evil mode for anzu
	(use-package evil-anzu
		:defer t
		:ensure t)
	;; lets use use avy with evil for jumping around easily
	(use-package evil-avy
		:ensure t
		:defer t
		:config
		(add-hook 'prog-mode-hook #'evil-avy-mode))
	(use-package evil-escape
		:ensure t
		:diminish evil-escape-mode
		:config
		(add-hook 'after-init-hook #'evil-escape-mode)
		(setq-default evil-escape-key-sequence "jk"))
	;; improved code folding - like vim
	(use-package vimish-fold
		:ensure t
		:diminish vimish-fold-mode
		:init
		;; evil compativility for vimish-fold
		(use-package evil-vimish-fold
			:ensure t)
		:config
		(vimish-fold-global-mode 1))
	(use-package evil-quickscope
		:ensure t
		:config
		(global-evil-quickscope-mode t))
	:config
	(evil-mode 1))

(use-package general
	:ensure t
	:config
	(general-evil-setup)
	;; Set keybinds for leader mode - we have lots of space
	;; TODO - vimish fold integration and other plugins
	(general-define-key
	 :states '(normal visual insert emacs)
	 :prefix "SPC"
	 :non-normal-prefix "M-SPC"
		"k" '(counsel-yank-pop :which-key "Kill Ring")
		"SPC" '(swiper :which-key "Swiper")
		":" '(counsel-M-x :which-key "M-x")
		"s" '(flyspell-correct-previous-word-generic :which-key "Spellcheck")
		"g" '(magit-status :which-key "Git")
		"?" '(counsel-locate :which-key "Locate")
		"/" '(counsel-rg :which-key "rg")
		;; Error checking specific bindings
		"c" '(:ignore t :which-key "Check")
		"cs" '(flyspell-correct-previous-word-generic :which-key "Check Word")
		"ce" '(flycheck-list-errors :which-key "All Errors")
		"cn" '(flycheck-next-error :which-key "Next Error")
		"cN" '(flycheck-previous-error :which-key "Prev Error")
		"ch" '(flycheck-explain-error-at-point :which-key "Help!")
		;; Buffer specific bindings
		"b" '(:ignore t :which-key "Buffer")
		"bb" '(ivy-switch-buffer :which-key "Switch")
		"bl" '(ibuffer :which-key "ibuffer")
		"bx" '(kill-buffer :which-key "Kill")
		"br" '(revert-buffer :which-key "Revert")
		;; File specific bindings
		"f" '(:ignore t :which-key "Files")
		"ff" '(counsel-find-file :which-key "Open")
		"fs" '(save-buffer :which-key "Save")
		"fS" '(save-some-buffers :which-key "Save All")
		"fb" '(bookmark-jump :which-key "Marks")
		"fd" '(delete-file :which-key "Delete")
		"fe" '(sudo-edit :which-key "Sudo")
		"ft" '(neotree :which-key "Tree")
		;; Jump specific bindings
		"j" '(:ignore t :which-key "Jump")
		"jj" '(avy-goto-char-2 :which-key "2 Char")
		"jw" '(avy-goto-word-1 :which-key "Word")
		"jl" '(avy-goto-line :which-key "Line")
		"jc" '(avy-goto-char :which-key "Char")
		"jd" '(dumb-jump-go :which-key "Defun")
		;; Appearance specific bindings
		"a" '(:ignore t :which-key "Appearance")
		"af" '(focus-mode :which-key "Focus")
		"ao" '(olivetti-mode :which-key "Olivetti")
		"ad" '(daytime-theme :which-key "Day")
		"an" '(night-theme :which-key "Night")
		;; Projectile specific bindings
		"p" '(:ignore t :which-key "Project")
		"pj" '(counsel-projectile :which-key "File")
		"pp" '(counsel-projectile-switch-project :which-key "Other Project")
		"pb" '(counsel-projectile-switch-to-buffer :which-key "Buffer")
		"px" '(projectile-kill-buffers :which-key "Killall")
		"pt" '(neotree :which-key "Tree")
		;; Window specific bindings
		"w" '(:ignore t :which-key "Window")
		"ww" '(ace-window :which-key "Jump")
		"w/" '(split-window-horizontally :which-key "Horizontal Split")
		"w-" '(split-window-vertically :which-key "Vertical Split")
		"wx" '(delete-window :which-key "Close")
		"wX" '(eyebrowse-close-window-config :which-key "Eyebrowse Close")
		"TAB" '(eyebrowse-last-window-config :which-key "Switch")
		"0" '(eyebrowse-switch-to-window-config-0 :which-key "W0")
		"1" '(eyebrowse-switch-to-window-config-1 :which-key "W1")
		"2" '(eyebrowse-switch-to-window-config-2 :which-key "W2")
		"3" '(eyebrowse-switch-to-window-config-3 :which-key "W3")
		"4" '(eyebrowse-switch-to-window-config-4 :which-key "W4")
		"5" '(eyebrowse-switch-to-window-config-5 :which-key "W5")
		"6" '(eyebrowse-switch-to-window-config-6 :which-key "W6")
		"7" '(eyebrowse-switch-to-window-config-7 :which-key "W7")
		"8" '(eyebrowse-switch-to-window-config-8 :which-key "W8")
		"9" '(eyebrowse-switch-to-window-config-9 :which-key "W9")
		;; Delimiter Bindings - More to do here...
		"d" '(:ignore t :which-key "Delimiters")
		"ds" '(sp-slurp-hybrid-sexp :which-key "Slurp")
		"db" '(sp-barf-hybrid-sexp :which-key "Barf")
		;; Misc Bindings
		"z" '(zzz-to-char :which-key "Zap!")
		"u" '(undo-tree-visualize :which-key "Undo Tree")))

;; god-mode for evil - comma lets use use normal emacs keybinds easily
(use-package god-mode
	:ensure t)
(use-package evil-god-state
	:ensure t)
(evil-define-key 'normal global-map "," 'evil-execute-in-god-state)

;;; zm-evil.el ends here
