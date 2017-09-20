;; Require packages for following code
(require 'dash)
(use-package outshine
	:ensure t)

;; Required for outshine
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)

;; Enables outline-minor-mode for *ALL* programming buffers
(add-hook 'prog-mode-hook 'outline-minor-mode)

;; Narrowing now works within the headline rather than requiring to be on it
(advice-add 'outshine-narrow-to-subtree :before
            (lambda (&rest args) (unless (outline-on-heading-p t)
															(outline-previous-visible-heading 1))))

;; outlines.el ends here
