;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

; Load zenburn theme
(load-theme 'zenburn t)

; Set font (I don't know if this actually works)
(setq doom-font (font-spec :family "Hack Nerd Font" :size 12))


; Allow tramp to find programs outside of /usr/bin
(require 'tramp)
(add-to-list 'tramp-remote-path "~/usr/local/bin/")
(add-to-list 'tramp-remote-path "~/.cargo/bin/")

; Tramp options to make it suck less, and to give more debug info when it still
; sucks
(setq tramp-verbose 10)
(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)
(setq explicit-shell-file-name "/bin/bash")
(setq shell-file-name "/bin/bash")

; Configure doom-modeline
(setq doom-modeline-project-detection 'project)
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
