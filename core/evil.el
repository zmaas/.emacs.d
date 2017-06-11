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
		;; evil compatibility for vimish-fold
		(use-package evil-vimish-fold
			:ensure t)
		:config
		(vimish-fold-global-mode 1))
	(use-package evil-goggles
		:ensure t
		:config
		(evil-goggles-mode))
	(use-package evil-snipe
		:ensure t
		:config
		(evil-snipe-override-mode 1))
		(setq evil-snipe-scope 'visible)
	:config
	(evil-mode 1))

(use-package general
	:ensure t
	:config
	(general-evil-setup)
	;; set keybinds for leader mode - we have lots of space
	;; todo - vimish fold integration and other plugins
	(general-define-key
	 :states '(normal visual insert emacs)
	 :prefix "SPC"
	 :non-normal-prefix "M-SPC"
	 ;; l key is reserved for mode-specific settings
	 "l" '(:ignore t :which-key "layer")
	 "k" '(counsel-yank-pop :which-key "kill ring")
	 "SPC" '(swiper :which-key "swiper")
	 ":" '(counsel-M-x :which-key "M-x")
	 "s" '(flyspell-correct-previous-word-generic :which-key "spellcheck")
	 "g" '(magit-status :which-key "git")
	 "?" '(counsel-locate :which-key "locate")
	 "/" '(counsel-rg :which-key "rg")
	 ;; error checking specific bindings
	 "e" '(:ignore t :which-key "check")
	 "es" '(flyspell-correct-previous-word-generic :which-key "check word")
	 "ee" '(flycheck-list-errors :which-key "all errors")
	 "en" '(flycheck-next-error :which-key "next error")
	 "en" '(flycheck-previous-error :which-key "prev error")
	 "eh" '(flycheck-explain-error-at-point :which-key "help!")
	 ;; buffer specific bindings
	 "b" '(:ignore t :which-key "buffer")
	 "bb" '(ivy-switch-buffer :which-key "switch")
	 "bl" '(ibuffer :which-key "ibuffer")
	 "bx" '(kill-buffer :which-key "kill")
	 "br" '(revert-buffer :which-key "revert")
	 ;; file specific bindings
	 "f" '(:ignore t :which-key "files")
	 "ff" '(counsel-find-file :which-key "open")
	 "fs" '(save-buffer :which-key "save")
	 "fS" '(save-some-buffers :which-key "save all")
	 "fb" '(bookmark-jump :which-key "marks")
	 "fd" '(delete-file :which-key "delete")
	 "fe" '(sudo-edit :which-key "sudo")
	 "ft" '(neotree :which-key "tree")
	 ;; jump specific bindings
	 "j" '(:ignore t :which-key "jump")
	 "jj" '(avy-goto-char-2 :which-key "2 char")
	 "jf" '(counsel-find-file :which-key "file")
	 "jb" '(ivy-switch-buffer :which-key "buffer")
	 "jw" '(avy-goto-word-1 :which-key "word")
	 "jl" '(avy-goto-line :which-key "line")
	 "jc" '(avy-goto-char :which-key "char")
	 "jd" '(dumb-jump-go :which-key "dumb jump")
	 ;; appearance specific bindings
	 "a" '(:ignore t :which-key "appearance")
	 "af" '(focus-mode :which-key "focus")
	 "al" '(linum-mode :which-key "linum")
	 "ao" '(olivetti-mode :which-key "olivetti")
	 "ad" '(daytime-theme :which-key "day")
	 "an" '(night-theme :which-key "night")
	 ;; projectile specific bindings
	 "p" '(:ignore t :which-key "project")
	 "pj" '(counsel-projectile :which-key "file")
	 "pp" '(counsel-projectile-switch-project :which-key "other project")
	 "pb" '(counsel-projectile-switch-to-buffer :which-key "buffer")
	 "px" '(projectile-kill-buffers :which-key "killall")
	 "pt" '(neotree :which-key "tree")
	 ;; window specific bindings
	 "w" '(:ignore t :which-key "window")
	 "ww" '(ace-window :which-key "jump")
	 "w/" '(split-window-horizontally :which-key "horizontal split")
	 "w-" '(split-window-vertically :which-key "vertical split")
	 "wx" '(delete-window :which-key "close")
	 "wX" '(eyebrowse-close-window-config :which-key "eyebrowse close")
	 "TAB" '(eyebrowse-last-window-config :which-key "switch")
	 "wj" '(eyebrowse-switch-to-window-config :which-key "config jump")
	 "wr" '(eyebrowse-rename-window-config :which-key "rename")
	 "0" '(eyebrowse-switch-to-window-config-0 :which-key "w0")
	 "1" '(eyebrowse-switch-to-window-config-1 :which-key "w1")
	 "2" '(eyebrowse-switch-to-window-config-2 :which-key "w2")
	 "3" '(eyebrowse-switch-to-window-config-3 :which-key "w3")
	 "4" '(eyebrowse-switch-to-window-config-4 :which-key "w4")
	 "5" '(eyebrowse-switch-to-window-config-5 :which-key "w5")
	 "6" '(eyebrowse-switch-to-window-config-6 :which-key "w6")
	 "7" '(eyebrowse-switch-to-window-config-7 :which-key "w7")
	 "8" '(eyebrowse-switch-to-window-config-8 :which-key "w8")
	 "9" '(eyebrowse-switch-to-window-config-9 :which-key "w9")
	 ;; delimiter bindings - more to do here...
	 "d" '(:ignore t :which-key "delimiters")
	 "dd" '(er/expand-region :which-key "expand region")
	 "ds" '(sp-slurp-hybrid-sexp :which-key "slurp")
	 "db" '(sp-barf-hybrid-sexp :which-key "barf")
	 "dx" '(sp-kill-sexp :which-key "kill")
	 "dr" '(sp-rewrap-sexp :which-key "rewrap")
	 "du" '(sp-unwrap-sexp :which-key "unwrap")
	 "dc" '(sp-convolute-sexp :which-key "convolute")
	 "dl" '(sp-forward-sexp :which-key "forward")
	 "dh" '(sp-backward-sexp :which-key "backward")
	 "dS" '(sp-split-sexp :which-key "split")
	 "da" '(sp-absorb-sexp :which-key "absorb")
	 ;; misc bindings
	 "z" '(zzz-to-char :which-key "zap!")
	 "u" '(undo-tree-visualize :which-key "undo tree")))

;;; zm-evil.el ends here
