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
	:config
	(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
	(add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

(use-package tide
	:ensure t
	:config
	(tide-setup)
	(add-hook 'js2-mode-hook #'tide-mode))

(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'js2-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "ll" '(tide-fix :which-key "lint")
 "ld" '(tide-jump-to-definition :which-key "goto def")
 "lf" '(tide-format :which-key "format")
 "lc" '(multi-compile-run :which-key "compile"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; js.el ends here
