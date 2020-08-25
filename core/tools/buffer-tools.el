;;; buffer-tools -- Summary:
;;; Commentary:
;; configuration of buffer utility packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; Improve default ibuffer setup
(global-set-key (kbd "C-x C-b") 'ibuffer)
(use-package ibuffer-vc
  :straight t
	:config
	(add-hook 'ibuffer-hook
						(lambda ()
							(ibuffer-vc-set-filter-groups-by-vc-root)
							(unless (eq ibuffer-sorting-mode 'alphabetic)
								(ibuffer-do-sort-by-alphabetic)))))

;; give our buffers unique names
(use-package uniquify
	:config
	(setq uniquify-buffer-name-style 'forward
				uniquify-after-kill-buffer-p t
				uniquify-ignore-buffers-re "^\\*"))

;; Automatically save buffers, but better
; (use-package auto-save-buffers-enhanced
;   :straight t
;   :init (auto-save-buffers-enhanced t)
;   :config
;   (setq auto-save-buffers-enhanced-interval 10.0
;         ;; Don't auto-save org source popups
;         auto-save-buffers-enhanced-exclude-regexps '("Org Src")
;         ;; Save things quietly
;         auto-save-buffers-enhanced-quiet-save-p t))

;; Workgroups	keeps track of our buffers between sessions
(use-package workgroups2
	:straight t
	:diminish workgroups-mode
	:config
	(setq wg-session-load-on-start t)
	(setq wg-session-file "~/.emacs.d/workgroups")
	(setq wg-emacs-exit-save-behavior           'save)
	(setq wg-workgroups-mode-exit-save-behavior 'save)
	(setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
	(setq wg-flag-modified t)                 ; Display modified flags as well
	(setq wg-mode-line-decor-left-brace "["
				wg-mode-line-decor-right-brace "]"  ; how to surround it
				wg-mode-line-decor-divider ":")
	(workgroups-mode t))

;; Persp-mode	manages workspaces persistently
;; (use-package persp-mode
;; 	:straight t
;; 	:diminish persp-mode
;; 	:config
;;   (setq wg-morph-on nil) ;; switch off animation
;;   (setq persp-autokill-buffer-on-remove 'kill-weak)
;;   (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))

;; Better bookmarks, since they're so useful
;; (use-package bookmark+
;;   :straight t
;;   :init (setq bmkp-replace-EWW-keys-flag t)
;;   :config
;;   (setq bookmark-version-control t
;;         ;; auto-save bookmarks
;;         bookmark-save-flag 1))
