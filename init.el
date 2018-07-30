;;; init.el --- Emacs init file
;;
;; Filename: init.el
;; Description:	Emacs Initialization File
;; Author: Zach Maas <zach.maas@gmail.com>
;; Maintainer: Zach Maas <zach.maas@gmail.com>
;; Created: Mon Jul 16 09:15:23 2018 (-0600)
;; Version:	0.0.1
;; URL: https://github.com/zmaas/.emacs.d
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;      ___           ___           ___
;;     /\  \         /\  \         /\  \
;;    /::\  \        \:\  \       /::\  \
;;   /:/\:\  \        \:\  \     /:/\:\  \
;;  /:/  \:\  \   _____\:\  \   /:/  \:\  \
;; /:/__/ \:\__\ /::::::::\__\ /:/__/ \:\__\
;; \:\  \ /:/  / \:\~~\~~\/__/ \:\  \ /:/  /
;;  \:\  /:/  /   \:\  \        \:\  /:/  /
;;   \:\/:/  /     \:\  \        \:\/:/  /
;;    \::/  /       \:\__\        \::/  /
;;     \/__/         \/__/         \/__/
;;                  EMACS
;; Emacs configuration file targeting Emacs 26
;; Author: Zach Maas (zach.maas@gmail.com)
;; Configured for use on Arch Linux, vc using git
;; For more information, see README
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

;; Allow packages to load
(package-initialize)

;; Setup Garbage Collection Threshold for Speed
(setq gc-cons-threshold (* 5 1024 1024))

;; Load bootstrapping code
(load-file "~/.emacs.d/core/jack-in.el")

;; ono!	=	module
;; ono! = submodule

;; Load from personal init files
(ono! :secrets "personal") 							; These are my secrets.

;; Load startup defults to save our sanity
(ono! :core :startup "archives") 			; We need packages. Duh.

(ono! :core :startup "defaults") 			;	Sane defaults	for our	sanity

;; Leverage our bootstrapping code
(ono! :core :essential "evil")					; VIM, but more sinister
(ono! :core :essential "keybinds")      ;	Keys like a piano
(ono! :core :essential "ivy") 					; Complete all the things
(ono! :core :essential "helm")          ; Other	completion stuff
(ono! :core :essential "popups")        ;	Useful, but hard to tame
(ono! :core :checks "error-checks")     ;	Programming is very hard
(ono! :core :checks "style-checks")     ; So is	English
(ono! :core :tools "hydras")            ; HAIL!	Temporary keymaps
(ono! :core :tools "completions") 			;	I like saving effort.
;; (ono! :core :tools "lsp")               ;	Support for language server protocol
(ono! :core :tools "utils") 						;	Lots of little things
(ono! :core :tools "vc")                ;	Saving stuff on steroids
(ono! :core :tools "buffer-tools")      ;	Open everything, all the time
(ono! :core :tools "shell") 						; ESHELL IS LOVE.
(ono! :core :tools "prodigy") 					; Convenient management of externs
(ono! :core :tools "virtualization")    ; Docker and vagrant configuration

;; Load various app configurations
(ono! :apps "mail")                     ; mu4e,4 u and me.
(ono! :apps "irc") 											;	to talk with other emacsen
(ono! :apps "elfeed")                   ;	read the feeds
(ono! :apps "games")                    ;	games!
(ono! :apps "hugo")                     ;	hugo

;; Theming configuration files
(ono! :core :appearance "themes")       ;	Behold my mighty colors and despair
(ono! :core :appearance "appearance") 	;	Fix the remnants of the	1980's
(ono! :core :appearance "highlighting") ;	Use those	colors everywhere
(ono! :core :appearance "interface")    ;	Hip, new	interfacing

;; Ono-custom-magic
(ono! :core :ono-extensions "magit-tweaks")  ; Custom magit icons
;; (ono! :core :ono-extensions "outlines")	    ;	Universal	outlines
(ono! :core :ono-extensions "ono-generic-functions") ; Custom commands
(ono! :core :ono-extensions "dispatch") ; Prototype of Dispatch.vim

;; Markup Langauges
(ono! :lang "latex") 										;	No better way to make pretentious	docs
(ono! :lang "org") 											;	Org will slowly consume your life
(ono! :lang "md") 											;	Yetanotherhipstermarkdownlanguage

;; Programming Languages
;; First Class Support - Frequent Use
(ono! :lang "lisp")                     ; (p(a(r(e(n(s))))))
(ono! :lang "python") 									;	Simple != easy
(ono! :lang "c++") 											;	if c=1,	c++ = 2?
(ono! :lang "haskell") 									;	Theoretically functional?
;; Second Class Support - Less Common Use
(ono! :lang "clojure") 									; Lisp hijacks JS and the JVM
(ono! :lang "go") 											;	C, but for parallel brogrammers
(ono! :lang "rust")											;	C++, but more hardcore?
;; Preliminary Support - Occasional Use
(ono! :lang "r") 												;	Stats, stats, stats!
(ono! :lang "java") 										;	a	cup of kaffe
(ono! :lang "debug") 										;	sometimes stuff breaks
(ono! :lang "web")                      ; internets

;; Set our default theme
(ono-dark-night-theme)

;; Load custom-set-variables file
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(put 'erase-buffer 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(provide 'init)

;;; init.el ends here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
