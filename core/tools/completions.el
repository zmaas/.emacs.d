;;; completions.el --- Completions for emacs
;;
;; Filename: completions.el
;; Description: Completions for emacs
;; Author: Zach Maas <zach.maas@gmail.com>
;; Maintainer: Zach Maas <zach.maas@gmail.com>
;; Created: Thu Jul 19 09:12:12 2018 (-0600)
;; Version: 0.0.1
;; URL: N/A
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; Basic completion configuration for emacs
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

;; company - easy auto-completion of code for all modes and documentation integration
(use-package company
	:ensure t
	:init
	(use-package company-prescient
		:ensure t
		:config
		(company-prescient-mode t))
	(use-package company-quickhelp
		:ensure t
		:config
		(company-quickhelp-mode 1)
		(setq company-quickhelp-delay 1))
	(use-package company-dabbrev
		:init
		(setq company-dabbrev-ignore-case nil
					;; don't downcase dabbrev suggestions
					company-dabbrev-code-other-buffers t
					company-tooltip-align-annotations t
					company-dabbrev-downcase nil))
	(use-package company-dabbrev-code
		:init
		(setq company-dabbrev-code-modes t
					company-dabbrev-code-ignore-case nil))
	(use-package company-posframe
		:disabled t
		:ensure t
		:diminish company-posframe-mode
		:config
		(company-posframe-mode nil))
	:diminish company-mode
	:config
	(global-company-mode t)
	;; Make it work more like	Vim's YCM, TAB cycling
	(company-tng-configure-default)
	;; More convenient bindings
	(setq company-minimum-prefix-length 2
				company-tooltip-limit	10
				company-idle-delay 0.25
				company-show-numbers t
				company-require-match 'never
				company-selection-wrap-around t
				company-tooltip-align-annotations t)
	;; Setup Default Backends
	(setq company-backends
				'((company-yasnippet
					 company-capf
					 company-files          ; files & directory
					 company-keywords       ; keywords
					 company-dabbrev
					 ;; company-abbrev
					 )))

	(general-define-key
	 :keymaps 'company-active-map
	 "M-o" 'counsel-company
	 "M-o" 'counsel-company
	 "RET" 'company-complete-selection))

(use-package dabbrev)

;; hippie-expand: better builtin expansion
(use-package hippie-exp
  :init
  (setq hippie-expand-try-functions-list
				'(try-expand-dabbrev
					try-expand-dabbrev-all-buffers
					try-expand-dabbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol)))

(use-package yasnippet
	:ensure t
	:diminish yas-global-mode yas-minor-mode
	:init
	(use-package yasnippet-snippets
		:ensure t)
	(use-package ivy-yasnippet
		:ensure t)
	:config
	(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
	(defvar company-mode/enable-yas t
		"Enable yasnippet for all backends.")

	(defun company-mode/backend-with-yas (backend)
		(if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
				backend
			(append (if (consp backend) backend (list backend))
							'(:with company-yasnippet))))

	(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
	(yas-global-mode t))

;; auto-yasnippet, removing friction for repetitive tasks
(use-package auto-yasnippet
	:ensure t)

;; Extend yasnippet using yankpad
(use-package yankpad
	:ensure t
	:config
	(setq yankpad-file "~/Dropbox/Org/yankpad.org"))

(use-package xlicense
	:ensure t)

(use-package header2
	:ensure t
	:config
	(setq make-header-hook '(;;header-mode-line
													 header-title
													 header-blank
													 header-file-name
													 header-description
													 ;;header-status
													 header-author
													 header-maintainer
													 header-copyright
													 header-creation-date
													 ;;header-rcs-id
													 header-version
													 ;; header-pkg-requires
													 ;;header-sccs
													 ;; header-modification-date
													 ;; header-modification-author
													 ;; header-update-count
													 header-url
													 ;; header-doc-url
													 header-blank
													 header-lib-requires
													 header-end-line
													 header-commentary
													 header-blank
													 header-blank
													 header-blank
													 header-end-line
													 ;; header-history
													 ;; header-blank
													 ;; header-blank
													 ;; header-rcs-log
													 ;; header-end-line
													 header-free-software
													 header-code
													 header-eof)))

;; Tiny, for fast expansion of linear ranges
(use-package tiny
	:ensure t
	:config
	(tiny-setup-default))

;; Better ripgrep interface
(use-package deadgrep
	:ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; completions.el ends here
