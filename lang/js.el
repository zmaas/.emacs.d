;;; js.el---Javascript configuration
;;
;; Filename:js.el
;; Description:
;; Author:
;; Maintainer:
;; Created:Thu Aug 30 22:26:56 2018(-0600)
;; Version:
;; URL:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; Emacs configuration for js development
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and / or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(use-package js2-mode
	:ensure t
	:init
	(use-package rjsx-mode
		:ensure t)
	(use-package prettier-js
		:ensure t)
	:config
	(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
	(add-hook 'js-mode-hook 'prettier-js-mode)
	(add-hook 'js-mode-hook 'emmet-mode)
	(add-to-list 'aggressive-indent-excluded-modes 'js-mode)
	(add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

(use-package add-node-modules-path
	:ensure t
	:config
  (add-hook 'tide-mode-hook #'add-node-modules-path))


(use-package tide
	:ensure t
	:config
	(add-hook 'rjsx-mode-hook #'tide-setup)
	(add-hook 'js2-mode-hook #'tide-setup)
	(add-hook 'js2-minor-mode-hook #'tide-setup)
	(add-hook 'js-mode-hook #'tide-setup))															


(use-package indium
	:ensure t)

(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'js-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "ll" '(tide-fix :which-key "lint")
 "ld" '(tide-jump-to-definition :which-key "goto def")
 "lf" '(tide-format :which-key "format")
 "lc" '(multi-compile-run :which-key "compile"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; js.el ends here
