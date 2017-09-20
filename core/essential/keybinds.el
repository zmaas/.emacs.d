;;; Keybinds -- Summary:
;;; Commentary:
;;; Keybinding configuration for Emacs
;;; generated by Zach Maas

;;; Code:

(use-package general
	:ensure t
	:config
	(general-evil-setup)
	;; set keybinds for leader mode - we have lots of space
	(general-define-key
	 :states '(normal visual insert emacs)
	 :prefix "SPC"
	 :non-normal-prefix "M-SPC"
	 ;; l key is reserved for mode-specific settings
	 "l" '(:ignore t :which-key "layer")
	 ;; o key is reserved for orgmode settings
	 "o" '(:ignore t :which-key "org")
	 ;; Most used commands have an easy 1 key binding
	 "k" '(counsel-yank-pop :which-key "kill ring")
	 "SPC" '(counsel-grep-or-swiper :which-key "swiper")
	 ":" '(counsel-M-x :which-key "M-x")
	 "s" '(flyspell-correct-previous-word-generic :which-key "spellcheck")
	 "g" '(magit-status :which-key "git")
	 "?" '(counsel-locate :which-key "locate")
	 "/" '(counsel-grep :which-key "rg")
	 "," '(ivy-switch-buffer :which-key "swbuf")
	 ;; error checking specific bindings
	 "e" '(:ignore t :which-key "check")
	 "es" '(flyspell-correct-previous-word-generic :which-key "check word")
	 "eS" '(synosaurus-lookup :which-key "synonym")
	 "ed" '(counsel-dash :which-key "dash")
	 "ee" '(flycheck-list-errors :which-key "all errors")
	 "en" '(flycheck-next-error :which-key "next error")
	 "eN" '(flycheck-previous-error :which-key "prev error")
	 "eh" '(flycheck-explain-error-at-point :which-key "help!")
	 ;; buffer specific bindings
	 "b" '(:ignore t :which-key "buffer")
	 "bb" '(ivy-switch-buffer :which-key "switch")
	 "bl" '(ibuffer :which-key "ibuffer")
	 "bx" '(kill-buffer :which-key "kill")
	 "br" '(revert-buffer :which-key "revert")
	 ;; file specific bindings
	 "f" '(:ignore t :which-key "files")
	 "fq" '(quickrun :which-key "quickrun")
	 "ff" '(counsel-find-file :which-key "open")
	 "fs" '(save-buffer :which-key "save")
	 "fS" '(save-some-buffers :which-key "save all")
	 "fb" '(bookmark-jump :which-key "marks")
	 "fb" '(bookmark-file :which-key "marks")
	 "fd" '(ranger :which-key "directory")
	 "fD" '(delete-file :which-key "delete")
	 "fr" '(sudo-edit :which-key "sudo")
	 "fR" '(ono-re-init :which-key "re-init")
	 "ft" '(neotree :which-key "tree")
	 ;; Insertion editing tools
	 "i" '(:ignore t :which-key "insertion")
	 "ia" '(aya-create :which-key "create snippet")
	 "ie" '(aya-expand :which-key "expand saved snippet")
	 "ir" '(re-builder :which-key "re-builder")
	 "it" '(tiny-expand :which-key "tiny expand")
	 ;; jump specific bindings
	 "j" '(:ignore t :which-key "jump")
	 "jj" '(avy-goto-char-2 :which-key "2 char")
	 "jf" '(counsel-find-file :which-key "file")
	 "jb" '(ivy-switch-buffer :which-key "buffer")
	 "jw" '(avy-goto-word-1 :which-key "word")
	 "jl" '(avy-goto-line :which-key "line")
	 "jc" '(avy-goto-char :which-key "char")
	 "jd" '(dumb-jump-go :which-key "dumb jump")
	 "jD" '(dumb-jump-back :which-key "dumb jump back")
	 ;; appearance specific bindings
	 "a" '(:ignore t :which-key "appearance")
	 "af" '(focus-mode :which-key "focus")
	 "al" '(nlinum-mode :which-key "linum")
	 "aS" '(smooth-scrolling-mode :which-key "smooth-scrolling")
	 "ao" '(olivetti-mode :which-key "olivetti")
	 "ad" '(daytime-theme :which-key "day")
	 "as" '(daytime-space-theme :which-key "spaceday")
	 "an" '(night-theme :which-key "night")
	 "ac" '(dark-night-theme :which-key "cyberpunk")
	 ;; projectile specific bindings
	 "p" '(:ignore t :which-key "project")
	 "pj" '(counsel-projectile :which-key "file")
	 "ps" '(ivy-imenu-anywhere :which-key "imenu-anywhere")
	 "pf" '(counsel-projectile-rg :which-key "project rg")
	 "pg" '(counsel-git-grep :which-key "git grep")
	 "pp" '(counsel-projectile-switch-project :which-key "other project")
	 "pb" '(counsel-projectile-switch-to-buffer :which-key "buffer")
	 "px" '(projectile-kill-buffers :which-key "killall")
	 "pt" '(neotree :which-key "tree")
	 ;; Configuration for [m]essaging tools
	 "m" '(:ignore t :which-key "mail")
	 "mi" '(mu4e :which-key "mu4e")
	 "mc" '(mu4e-compose-new :which-key "mu4e compose")
	 "ms" '(mu4e-headers-search :which-key "mu4e search")
	 "mf" '(circe :which-key "freenode")
	 "mp" '(proced :which-key "proced")
	 ;; window specific bindings
	 "w" '(:ignore t :which-key "window")
	 "ww" '(ace-window :which-key "jump")
	 "wV" '(split-window-horizontally :which-key "horizontal split")
	 "wv" '(split-window-vertically :which-key "vertical split")
	 "wx" '(delete-window :which-key "close")
	 "wl" '(evil-window-right :which-key "right")
	 "wk" '(evil-window-up :which-key "up")
	 "wj" '(evil-window-down :which-key "down")
	 "wh" '(evil-window-left :which-key "left")
	 "wu" '(winner-undo :which-key "undo")
	 "wr" '(winner-redo :which-key "redo")
	 "wpc" '(persp-add-new :which-key "new persp")
	 "wps" '(persp-switch :which-key "switch persp")
	 "wpw" '(persp-save-state-to-file :which-key "write persp")
	 "wpl" '(persp-load-state-from-file :which-key "load persp")
	 "wpk" '(persp-switch :which-key "kill buffer in persp")
	 "wpb" '(persp-switch-to-buffer :which-key "change buffer in persp")
	 "wpi" '(persp-import-buffers :which-key "import buffers to persp")
	 "wpa" '(persp-add-buffer :which-key "add buffer to persp")
	 "wpx" '(persp-kill-buffer :which-key "kill persp buffer")
	 "wpX" '(persp-kill :which-key "kill persp")
	 "wpr" '(persp-rename :which-key "rename persp")
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
	 ;; transpose and other text manipulation
	 "t"  '(:ignore t :which-key "transpose")
	 "tf"  '(fill-paragraph :which-key "fill paragraph")
	 "tw" '(transpose-words :which-key "transpose words")
	 "tl" '(transpose-lines :which-key "transpose lines")
	 "tp" '(transpose-lines :which-key "transpose paragraphs")
	 "tc" '(transpose-chars :which-key "transpose chars")
	 "ts" '(transpose-sexps :which-key "transpose sexp")
	 ;;	narrowing keybinds
	 "nn" '(outshine-narrow-to-subtree :which-key "narrow-subtree")
	 "nw" '(widen :which-key "widen")
	 ;; Structural edits
	 "nj" '(outline-move-subtree-down :which-key "down tree")
	 "nk" '(outline-move-subtree-up :which-key "up tree")
	 "nh" '(outline-promote :which-key "promote")
	 "nl" '(outline-demote :which-key "demote")
	 ;; misc bindings
	 "z" '(zzz-to-char :which-key "zap!")
	 "u" '(undo-tree-visualize :which-key "undo tree")))

;; Generic keybindings
(general-define-key
 :states '(norma)
 "M-k" '(delete-window))

;; Evil outline navigation keybindings
(general-define-key
 :states '(normal visual motion) 
 "gh" 'outline-up-heading
 "gj" 'outline-forward-same-level
 "gk" 'outline-backward-same-level
 "gl" 'outline-next-visible-heading
 "gu" 'outline-previous-visible-heading)

;; evil-multiedit keybindings
(general-define-key
 :states '(normal)
 "M-d" '(evil-multiedit-match-and-next)
 "M-D" '(evil-multiedit-match-and-prev))
(general-define-key
 :states '(visual)
 "R" '(evil-multiedit-match-all)
 "M-d" '(evil-multiedit-and-next)
 "M-D" '(evil-multiedit-and-prev)
 "C-M-D" '(evil-multiedit-restore))
(general-define-key
 :states '(insert)
 "M-d" '(evil-multiedit-toggle-marker-here))
(general-define-key
 :keymaps '(evil-motion-state)
 "RET" '(evil-multiedit-toggle-or-restrict-region))
(general-define-key
 :keymaps '(evil-multiedit-state-map)
 "RET" '(evil-multiedit-toggle-or-restrict-region)
 "C-n" '(evil-multiedit-next)
 "C-p" '(evil-multiedit-prev))
(general-define-key
 :keymaps '(evil-multiedit-insert-state-map)
 "C-n" '(evil-multiedit-next)
 "C-p" '(evil-multiedit-prev))

;; Custom ex bindings
(defalias 'ex! 'evil-ex-define-cmd)
(ex! "ie[dit]" 'evil-multiedit-ex-match)
(ex! "ag" 'counsel-ag)
(ex! "rg" 'counsel-rg)
(ex! "sw[iper]" 'swiper)
(ex! "org" 'org-capture)
(ex! "git" 'magit-status)
(ex! "gdiff" 'magit-diff-buffer-file)
(ex! "glog" 'magit-log-buffer-file)
(ex! "gblame" 'magit-blame)
(ex! "a" 'counsel-projectile-find-file)
(ex! "evb" 'eval-buffer)
(ex! "init" 'ono-re-init)
(ex! "wcu" 'whitespace-cleanup)

;; keybinds.el ends here
