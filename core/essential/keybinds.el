;;; keybinds.el --- Keybinding configuration for Emacs
;;
;; Filename: keybinds.el
;; Description: Keybinding configuration for Emacs
;; Author: Zach Maas <zach.maas@gmail.com>
;; Maintainer: Zach Maas <zach.maas@gmail.com>
;; Created: Sat Jul  7 15:37:34 2018 (-0600)
;; Version: 0.0.1
;; Last-Updated: Sat Jul  7 15:38:03 2018 (-0600)
;;           By: zach
;; URL: N/A
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; Keybinding configuration for Emacs
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;

;;; Code:

(use-package general
	:straight t
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
	 ;; r key is used for rifle
	 "r" '(helm-org-rifle :which-key "rifle")
	 ;; Most used commands have an easy 1 key binding
	 "k" '(counsel-yank-pop :which-key "kill ring")
	 "c" '(poporg-dwim :which-key "poporg")
	 "SPC" '(swiper :which-key "swiper")
	 "TAB" '(evil-buffer :which-key "last")
	 "ESC" '(format-all-buffer :which-key "fmt")
	 "." '(bookmark-jump :which-key "bookmark")
	 ":" '(counsel-M-x :which-key "M-x")
	 "s" '(flyspell-correct-previous :which-key "spellcheck")
	 "?" '(counsel-locate :which-key "locate")
	 "/" '(helm-multi-swoop-projectile :which-key "swipeall")
	 "," '(ivy-switch-buffer :which-key "swbuf")
	 ;; help commands
	 "h" '(:ignore t :which-key "help")
	 "hf" '(describe-function :which-key "function")
	 "ha" '(counsel-apropos :which-key "apropos")
	 "hk" '(describe-key :which-key "key")
	 "hv" '(describe-variable :which-key "variable")
	 "hd" '(counsel-dash :which-key "dash")
	 ;; git commands
	 "g" '(:ignore t :which-key "git")
	 "gg" '(magit-status :which-key "status")
	 "gs" '(magit-stage-file :which-key "stage")
	 "gu" '(magit-unstage-file :which-key "unstage")
	 "ge" '(magit-ediff-dwim :which-key "ediff")
	 "gd" '(magit-diff-buffer-file :which-key "diff")
	 "gl" '(magit-log-buffer-file :which-key "log")
	 "gb" '(magit-blame :which-key "blame")
	 "gt" '(git-timemachine :which-key "blame")
	 ;; deft commands
	 ";" '(:ignore t :which-key "deft")
	 ;; ";;" '(helm-org-rifle :which-key "rifle")
	 ";d" '(deft :wk "deft")
	 ";D" '(zetteldeft-deft-new-search :wk "new search")
	 ";R" '(deft-refresh :wk "refresh")
	 ";s" '(zetteldeft-search-at-point :wk "search at point")
	 ";c" '(zetteldeft-search-current-id :wk "search current id")
	 ";f" '(zetteldeft-follow-link :wk "follow link")
	 ";F" '(zetteldeft-avy-file-search-ace-window :wk "avy file other window")
	 ";l" '(zetteldeft-avy-link-search :wk "avy link search")
	 ";t" '(zetteldeft-avy-tag-search :wk "avy tag search")
	 ";T" '(zetteldeft-tag-buffer :wk "tag list")
	 ";i" '(zetteldeft-find-file-id-insert :wk "insert id")
	 ";I" '(zetteldeft-find-file-full-title-insert :wk "insert full title")
	 ";o" '(zetteldeft-find-file :wk "find file")
	 ";n" '(zetteldeft-new-file :wk "new file")
	 ";N" '(zetteldeft-new-file-and-link :wk "new file & link")
	 ";r" '(zetteldeft-file-rename :wk "rename")
	 ";x" '(zetteldeft-count-words :wk "count words")
	 ;; error checking specific bindings
	 "e" '(:ignore t :which-key "check")
	 "es" '(flyspell-correct-previous-word-generic :which-key "check word")
	 "eS" '(synosaurus-lookup :which-key "synonym")
	 "ee" '(flycheck-list-errors :which-key "all errors")
	 "en" '(flycheck-next-error :which-key "next error")
	 "eN" '(flycheck-previous-error :which-key "prev error")
	 "eh" '(flycheck-explain-error-at-point :which-key "help!")
	 "eh" '(whitespace-cleanup :which-key "whitespace-cleanup")
	 ;; buffer specific bindings
	 "b" '(:ignore t :which-key "buffer")
	 "bb" '(ivy-switch-buffer :which-key "switch")
	 "bl" '(ibuffer :which-key "ibuffer")
	 "bx" '(kill-buffer :which-key "kill")
	 "br" '(revert-buffer :which-key "revert")
	 ;; file specific bindings
	 "f" '(:ignore t :which-key "files")
	 "fq" '(quickrun :which-key "quickrun")
	 "fe" '(ono-open-init-file :which-key "init.el")
	 "ff" '(counsel-find-file :which-key "open")
	 "fs" '(save-buffer :which-key "save")
	 "fS" '(save-some-buffers :which-key "save all")
	 "fb" '(bookmark-jump :which-key "bookmarks")
	 "fB" '(bookmark-set :which-key "new bookmarks")
	 "fd" '(dired :which-key "directory")
	 ;; "fR" '(ranger :which-key "ranger")
	 "fx" '(delete-file :which-key "delete")
	 "fr" '(counsel-recentf :which-key "recent")
	 "ft" '(counsel-tramp :which-key "tramp")
	 "fl" '(swiper :which-key "lines")
	 ;; Insertion editing tools
	 "i" '(:ignore t :which-key "insertion")
	 "ia"  '(academic-phrases :which-key "academic phrase")
	 "is"  '(ivy-yasnippet :which-key "yas")
	 "id"  '(lod :which-key "ಠ_ಠ")
	 "il"  '(make-header :which-key "new header")
	 "ih" '(update-file-header :which-key "header update")
	 "ia" '(aya-create :which-key "create snippet")
	 "ie" '(aya-expand :which-key "expand saved snippet")
	 "ir" '(re-builder :which-key "re-builder")
	 "it" '(ono-insert-todo :which-key "todo")
	 "ib" '(comment-box :which-key "comment box")
	 "ie" '(tiny-expand :which-key "tiny expand")
	 ;; jump specific bindings
	 "j" '(:ignore t :which-key "jump")
	 "ji" '(imenu :which-key "imenu")
	 "js" '(helm-multi-swoop-all :which-key "swoop")
	 "jI" '(imenu-anywhere :which-key "imenu anywhere")
	 "jj" '(avy-goto-char-timer :which-key "avy")
	 "jf" '(counsel-find-file :which-key "file")
	 "jb" '(ivy-switch-buffer :which-key "buffer")
	 "jw" '(avy-goto-word-1 :which-key "word")
	 "jl" '(avy-goto-line :which-key "line")
	 "jc" '(avy-goto-char :which-key "char")
	 "jq" '(dumb-jump-quick-look :which-key "dumb jump peek")
	 "jd" '(dumb-jump-go :which-key "dumb jump")
	 "jD" '(dumb-jump-back :which-key "dumb jump back")
	 ;; appearance specific bindings
	 "a" '(:ignore t :which-key "appearance")
	 "af" '(focus-mode :which-key "focus")
	 "ar" '(writeroom-mode :which-key "writeroom")
	 "al" '(display-line-numbers-mode :which-key "line numbers")
	 "aS" '(smooth-scrolling-mode :which-key "smooth-scrolling")
	 "as" '(subword-mode :which-key "subword mode")
	 "aw" '(helm-surfraw :which-key "surfraw")
	 "ao" '(olivetti-mode :which-key "olivetti")
	 "at" '(eshell  :which-key "eshell")
	 "ad" '(deft  :which-key "deft")
	 "ae" '(elfeed  :which-key "elfeed")
	 "ai" '(imenu :which-key "imenu")
	 "aI" '(imenu-list :which-key "imenu-list")
	 "aC" '(calc :which-key "calc")
	 "az" '(zone :which-key "zone")
	 ;; Themes
	 "ac" '(:ignore t :which-key "colors")
	 "acd" '(ono-day-theme :which-key "day")
	 "acs" '(ono-day-bright-theme :which-key "day-bright")
	 "acc" '(ono-dark-night-theme :which-key "cyberpunk")
	 "acr" '(ono-plain-night-theme :which-key "plain dark")
	 "ap" '(prodigy :which-key "prodigy")
	 "aP" '(proced :which-key "proced")
	 ;; projectile specific bindings
	 "p" '(:ignore t :which-key "project")
	 "pj" '(counsel-projectile :which-key "file")
	 "pd" '(counsel-projectile-find-dir :which-key "dir")
	 "ps" '(ivy-imenu-anywhere :which-key "imenu-anywhere")
	 "pf" '(counsel-projectile-rg :which-key "project rg")
	 "pg" '(counsel-git-grep :which-key "git grep")
	 "pr" '(projectile-recentf :which-key "recent")
	 "pp" '(counsel-projectile-switch-project :which-key "other project")
	 "pb" '(counsel-projectile-switch-to-buffer :which-key "buffer")
	 "px" '(projectile-kill-buffers :which-key "killall")
	 "pt" '(projectile-run-eshell :which-key "eshell")
	 "pT" '(treemacs-projectile :which-key "tree")
	 "po" '(projectile-multi-occur :which-key "occur")
	 "pc" '(projectile-compile-project :which-key "compile")
	 ;; Configuration for [m]essaging tools
	 "m" '(:ignore t :which-key "mail")
	 "mi" '(mu4e :which-key "mu4e")
	 "mc" '(mu4e-compose-new :which-key "mu4e compose")
	 "ms" '(helm-mu :which-key "mu4e search")
	 "mn" '(notmuch :which-key "notmuch")
	 "mf" '(circe :which-key "freenode")
	 ;; window specific bindings
	 "w" '(:ignore t :which-key "window")
	 "ww" '(ace-window :which-key "jump")
	 "wV" '(split-window-horizontally :which-key "horizontal split")
	 "w/" '(split-window-horizontally :which-key "horizontal split")
	 "wv" '(split-window-vertically :which-key "vertical split")
	 "w-" '(split-window-vertically :which-key "vertical split")
	 "wx" '(delete-window :which-key "close")
	 "w=" '(balance-windows :which-key "balance windows")
	 "wl" '(evil-window-right :which-key "right")
	 "wk" '(evil-window-up :which-key "up")
	 "wj" '(evil-window-down :which-key "down")
	 "wh" '(evil-window-left :which-key "left")
	 "wu" '(winner-undo :which-key "undo")
	 "wR" '(winner-redo :which-key "redo")
	 "wr" '(evil-window-rotate-downwards :which-key "rotate")
	 "wm" '(ace-delete-other-windows :which-key "max")
	 "ws" '(ace-swap-window :which-key "swap")
	 ;; "wp" '(:ignore t :which-key "persp")
	 ;; "wpc" '(persp-add-new :which-key "new persp")
	 ;; "wps" '(persp-switch :which-key "switch persp")
	 ;; "wpw" '(persp-save-state-to-file :which-key "write persp")
	 ;; "wpl" '(persp-load-state-from-file :which-key "load persp")
	 ;; "wpk" '(persp-switch :which-key "kill buffer in persp")
	 ;; "wpb" '(persp-switch-to-buffer :which-key "change buffer in persp")
	 ;; "wpi" '(persp-import-buffers :which-key "import buffers to persp")
	 ;; "wpa" '(persp-add-buffer :which-key "add buffer to persp")
	 ;; "wpx" '(persp-kill-buffer :which-key "kill persp buffer")
	 ;; "wpX" '(persp-kill :which-key "kill persp")
	 ;; "wpr" '(persp-rename :which-key "rename persp")
	 "wg" '(:ignore t :which-key "workgroups")
	 "wgc" '(wg-create-workgroup :which-key "new workgroup")
	 "wgs" '(wg-switch-to-workgroup :which-key "switch workgroup")
	 "wgr" '(wg-rename-workgroup :which-key "rename workgroup")
	 "wgS" '(wg-save-session :which-key "save workgroup")
	 "wgR" '(wg-open-session :which-key "open workgroup")
	 "wgx" '(wg-kill-workgroup :which-key "kill workgroup")
	 ;; delimiter bindings - more to do here...
	 "d" '(:ignore t :which-key "delimiters")
	 "dd" '(er/expand-region :which-key "expand region")
	 "de" '(evil-lispy/enter-state-left :which-key "evil-lispy")
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
	 "t"  '(:ignore t :which-key "text")
	 "tf" '(ono-fill-or-unfill :which-key "fill paragraph")
	 "tt" '(multi-term :which-key "term")
	 "tn" '(multi-term-next :which-key "term next")
	 "tp" '(multi-term-previous :which-key "term prev")
	 "tw" '(transpose-words :which-key "transpose words")
	 "tl" '(transpose-lines :which-key "transpose lines")
	 "tp" '(transpose-lines :which-key "transpose paragraphs")
	 "tc" '(transpose-chars :which-key "transpose chars")
	 "ts" '(transpose-sexps :which-key "transpose sexp")
	 "ti"	'(evil-numbers/inc-at-pt :which-key "increment")
	 "td"	'(evil-numbers/dec-at-pt :which-key "decrement")
	 ;;	narrowing keybinds
	 "nd" '(narrow-to-defun :which-key "narrow-defun")
	 "ns" '(org-narrow-to-subtree :which-key "narrow-subtree")
	 "nn" '(narrow-to-region :which-key "narrow-region")
	 "nw" '(widen :which-key "widen")
	 ;; Structural edits
	 "nj" '(outline-move-subtree-down :which-key "down tree")
	 "nk" '(outline-move-subtree-up :which-key "up tree")
	 "nh" '(outline-promote :which-key "promote")
	 "nl" '(outline-demote :which-key "demote")
	 ;; misc bindings
	 "z" '(zzz-to-char :which-key "zap!")
	 "u" '(undo-tree-visualize :which-key "undo tree")))

;; Generic keybindings - VIM only
(general-define-key
 :states '(normal visual motion insert)
 "M-p" 'evil-paste-pop
 "M-;" 'evil-commentary-line
 "M-k" 'delete-window
 "M-%" 'vr/query-replace
 "M-/" 'hippie-expand
 "M-u" 'tiny-expand
 "M-q" 'ono-fill-or-unfill
 "C-;" 'ace-link
 "C-h f" #'helpful-callable
 "C-h v" #'helpful-variable
 "C-h k" #'helpful-key
 "C-c C-." #'helpful-at-point)

(general-define-key
 :states '(insert)
 "C-p" 'hippie-expand)

;; Universal keybinds
(general-define-key
 "M-[" 'evil-escape
 "C-x C-c" 'kill-emacs)

;; Rebinds
(global-set-key [remap fill-paragraph] #'ono-fill-or-unfill)

;; Evil custom keybinding
(general-define-key
 :states '(normal visual motion)
 "<XF86Search>" 'org-capture
 "\\"	'evil-execute-in-god-state
 "-" 'dired-jump
 "z/" 'counsel-fzf
 "zs" 'flyspell-auto-correct-previous-word
 "gb" 'ivy-switch-buffer
 "j" 'evil-next-visual-line
 "k" 'evil-previous-visual-line
 "]d" 'git-gutter:next-hunk
 "[d" 'git-gutter:previous-hunk
 "gi" 'sp-kill-symbol
 "gd" 'dumb-jump-go
 "C-'" 'avy-goto-line)

(general-define-key
 :keymaps 'evil-god-state-map
 "ESC" 'evil-god-state-bail
 "." 'repeat)

;; Setup for evil-multiedit
(general-define-key
 :states '(normal)
 "M-d"'evil-multiedit-match-symbol-and-next
 "M-D" 'evil-multiedit-match-symbol-and-prev)
(general-define-key
 :states '(visual)
 "R" 'evil-multiedit-match-all
 "C-M-D" 'evil-multiedit-restore
 "M-d" 'evil-multiedit-next
 "M-D" 'evil-multiedit-prev)
(general-define-key
 :states '(motion)
 "RET" 'evil-multiedit-toggle-or-restrict-region)
(general-define-key
 :keymaps 'evil-multiedit-state-map
 "n" 'evil-multiedit-next
 "N" 'evil-multiedit-prev)
(general-define-key
 :keymaps 'evil-multiedit-state-map
 "C-n"'evil-multiedit-and-next
 "C-p" 'evil-multiedit-and-prev)

;; evil-snipe setup
(general-define-key
 :states '(normal)
 "s" 'evil-snipe-s
 "S" 'evil-snipe-S
 "zs" 'nil)

;; Custom key-chord for very fast swiper access (fd -> swiper)
(use-package key-chord
	:straight t
	:config
	(key-chord-mode t)
	(key-chord-define evil-insert-state-map "jk" 'evil-escape))

;; Custom ex bindings: These provide emulation
;; of many of vim's builtin ex commands using emacs features
(defalias 'ex! 'evil-ex-define-cmd)
(ex! "make" 'multi-compile-run)
;; Replicate various vim	plugins
(ex! "Delete" 'delete-file)
(ex! "Copy" 'copy-file)
(ex! "Chmod" 'chmod)
(ex! "Mkdir" 'mkdir)
(ex! "F[iles]" 'counsel-fzf)
(ex! "B[uffers]" 'ivy-switch-buffer)
(ex! "ie[dit]" 'evil-multiedit-ex-match)
(ex! "SudoEdit" 'sudo-edit)
(ex! "mc" 'evil-mc-make-all-cursors)
(ex! "co[pen]" 'flycheck-list-errors)
(ex! "tjump" 'counsel-gtags-find-symbol)
(ex! "noh" 'evil-ex-nohighlight)
(ex! "rg" 'ono-deadgrep)
(ex! "sw[iper]" 'helm-multi-swoop-projectile)
(ex! "cap" 'org-capture)
;; Emulate fugitive.vim
(ex! "Gstatus" 'magit-status)
(ex! "Gstage" 'magit-stage-file)
(ex! "Gunstage" 'magit-unstage-file)
(ex! "Gdiff" 'magit-diff-buffer-file)
(ex! "Glog" 'magit-log-buffer-file)
(ex! "Grep" 'counsel-projectile-rg)
(ex! "Gblame" 'magit-blame)
;; Emulate vim tabs using	persp-mode
(ex! "wg" 'wg-switch-to-workgroup)
(ex! "tabnew" 'wg-create-workgroup)
(ex! "tabkill" 'wg-kill-workgroup-and-buffers)
(ex! "tabedit" 'wg-rename-workgroup)
(ex! "tabclose" 'wg-kill-workgroup)
(ex! "tabnext" 'wg-switch-to-workgroup-right)
(ex! "tabprevious" 'wg-switch-to-workgroup-left)
;; Other bindings
(ex! "a" 'counsel-projectile-find-file)
(ex! "evb" 'eval-buffer)
(ex! "init" 'ono-re-init)
(ex! "wcu" 'whitespace-cleanup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; keybinds.el ends here
