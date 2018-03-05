;;; Helm-Tools -- Summary:
;;; Commentary:
;;; helm configuration for Emacs
;;; generated by Zach Maas
;;; oof, this is a mess - need to do some cleanup

;; HELM - this is a big one, and does most of our searching
(use-package helm
	:ensure t
	:diminish helm-mode
	:init
	(require 'helm-config)
	(use-package helm-swoop
		:ensure t)
	(use-package helm-flx
		:ensure t
		:init
		(use-package flx
			:ensure t))
	(use-package helm-fuzzier
		:ensure t
		:config
		(helm-fuzzier-mode t))
	(use-package helm-ag
		:ensure t
		:config
		(set-variable 'helm-ag-base-command "ag --nocolor --nogroup --ignore-case --hidden"))
	(use-package helm-org-rifle
		:ensure t)
	:config
	;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
	;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
	;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
	(helm-flx-mode t)
	(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
	(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
	(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
	;; Evil mode bindings for helm
	(define-key helm-map (kbd "<escape>") 'helm-evil/body)

	(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
				helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
				helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
				helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
				helm-ff-file-name-history-use-recentf t)

	(helm-autoresize-mode t)
	(setq helm-m-x-fuzzy-match t)

	(setq helm-buffers-fuzzy-matching t
				helm-recentf-fuzzy-match    t)

	(setq helm-semantic-fuzzy-match t
				helm-imenu-fuzzy-match    t)

	;; save buffer when helm-multi-swoop-edit complete
	(setq helm-multi-swoop-edit-save t)

	;; if this value is t, split window inside the current window
	(setq helm-swoop-split-with-multiple-windows nil)

	;; split direcion. 'split-window-vertically or 'split-window-horizontally
	(setq helm-swoop-split-direction 'split-window-horizontally)

	;; if nil, you can slightly boost invoke speed in exchange for text color
	(setq helm-swoop-speed-or-color nil)

	;; ;; go to the opposite side of line from the end or beginning of line
	(setq helm-swoop-move-to-line-cycle t)

	;; optional face for line numbers
	;; face name is `helm-swoop-line-number-face`
	(setq helm-swoop-use-line-number-face t)

	;; match/search methods (fuzzy matching, migemo)
	;; if you do not preferr fuzzy, remove it from the list below
	(defvar helm-c-source-swoop-match-functions
		'(helm-mm-exact-match
			helm-mm-match
			helm-fuzzy-match
			(setq helm-c-source-swoop-search-functions
						'(helm-mm-exact-search
							helm-mm-search
							helm-candidates-in-buffer-search-default-fn
							helm-fuzzy-search))))	)

;;; zm-helm ends here
