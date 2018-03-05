;;; init.el
;; Commentary:
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
;;
;; Emacs configuration file targeting Emacs 25.2
;; Author: Zach Maas (zach.maas@gmail.com)
;; Configured for use on Arch Linux, vc using git
;; For more information, see README

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
(ono! :core :startup "patching") 			;	Sometimes we need to fix things
(ono! :core :startup "defaults") 			;	Sane defaults	for our	sanity

;; Leverage our bootstrapping code
(ono! :core :essential "evil")					; VIM, but more sinister
(ono! :core :essential "keybinds") 		;	Keys like a piano
(ono! :core :essential "ivy") 					; Complete all the things
(ono! :core :essential "helm") 				; Other	completion stuff
(ono! :core :essential "popups") 			;	Useful, but hard to tame
(ono! :core :checks "error-checks")    ;	Programming is very hard
(ono! :core :checks "style-checks")    ; So is	English
(ono! :core :tools "hydras") 					; HAIL!	Temporary keymaps
(ono! :core :tools "completions") 			;	I like saving effort.
(ono! :core :tools "utils") 						;	Lots of little things
(ono! :core :tools "vc") 							;	Saving stuff on steroids
(ono! :core :tools "buffer-tools") 		;	Open everything, all the time
(ono! :core :tools "shell") 						; ESHELL IS LOVE.
(ono! :core :tools "prodigy") 					; Convenient management of externs
(ono! :core :tools "virtualization") 	; Docker and vagrant configuration

;; Load various app configurations
(ono! :apps "mail")                     ; mu4e,4 u and me.
(ono! :apps "irc") 											;	to talk with other emacsen
(ono! :apps "elfeed")                   ;	read the feeds
(ono! :apps "games")                    ;	games!

;; Theming configuration files
(ono! :core :appearance "themes")      ;	Behold my mighty colors and despair
(ono! :core :appearance "appearance") 	;	Fix the remnants of the	1980's
(ono! :core :appearance "highlighting");	Use those	colors everywhere
(ono! :core :appearance "interface")   ;	Hip, new	interfacing

;; Ono-custom-magic
(ono! :core :ono-extensions "magit-tweaks")  ; Custom magit icons
;; (ono! :core :ono-extensions "outlines")	    ;	Universal	outlines
(ono! :core :ono-extensions "ono-generic-functions") ; Custom commands

;; Markup Langauges
(ono! :lang "latex") 										;	No better way to make pretentious	docs
(ono! :lang "org") 											;	Org will slowly consume your life
(ono! :lang "md") 											;	Yetanotherhipstermarkdownlanguage

;; Programming Languages
;; First Class Support - Frequent Use
(ono! :lang "python") 									;	Simple != easy
(ono! :lang "haskell") 									;	Did someone say math?
;; Second Class Support - Less Common Use
(ono! :lang "c++") 											;	if c=1,	c	++ = 2
(ono! :lang "lisp")                     ; (p(a(r(e(n(s))))))
(ono! :lang "clojure") 									; Lisp hijacks JS and the JVM
(ono! :lang "go") 											;	C, but for parallel brogrammers
;; Preliminary Support - Occasional Use
(ono! :lang "r") 												;	Stats, stats, stats!
(ono! :lang "java") 										;	a	cup of kaffe
(ono! :lang "debug") 										;	sometimes stuff breaks

;; Set our default theme
(ono-tron-theme)

;; Load custom-set-variables file
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(provide 'init)

;;; init.el ends here
