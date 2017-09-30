;;; buffer-tools -- Summary:
;;; Commentary:
;; configuration of buffer utility packages for Emacs
;;; generated by Zach Maas

;; Improve default ibuffer setup
(global-set-key (kbd "C-x C-b") 'ibuffer)
(use-package ibuffer-vc
  :ensure t
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
(use-package auto-save-buffers-enhanced
  :ensure t
  :init (auto-save-buffers-enhanced t)
  :config
  (setq auto-save-buffers-enhanced-interval 3.0
        ;; Don't auto-save org source popups
        auto-save-buffers-enhanced-exclude-regexps '("Org Src")
        ;; Save things quietly
        auto-save-buffers-enhanced-quiet-save-p t))

;; Persp-mode	manages workspaces persistently
(use-package persp-mode
	:ensure t
	:diminish persp-mode
	:config
  (setq wg-morph-on nil) ;; switch off animation
  (setq persp-autokill-buffer-on-remove 'kill-weak)
  (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))

;; Better bookmarks, since they're so useful
(use-package bookmark+
  :ensure t
  :init (setq bmkp-replace-EWW-keys-flag t)
  :config
  (setq bookmark-version-control t
        ;; auto-save bookmarks
        bookmark-save-flag 1))
