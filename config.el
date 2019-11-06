;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

; Load zenburn theme
(load-theme 'zenburn t)

; Set font (I don't know if this actually works)
(setq doom-font (font-spec :family "Hack Nerd Font" :size 12))

;; Use Minted
;(add-to-list 'org-latex-packages-alist '("" "minted"))
;(setq org-latex-listings 'minted)
;; style decision for source code blocks
;(setq org-latex-minted-options
;'(("bgcolor" "white") ("frame" "lines")))
; Don't evaluate code blocks
;(setq org-export-babel-evaluate nil)

; Change Org elipses
(setq org-ellipsis "⤵")

; Allow tramp to find custom git installations for magit
(require 'tramp)
(add-to-list 'tramp-remote-path "~/usr/local/bin/")

; Inherit shell PATH variable for executables in emacs
;(when (memq window-system '(mac ns x))
;  (exec-path-from-shell-initialize))
;  (exec-path-from-shell-copy-env "PATH")

; Tramp options to make it suck less, and to give more debug info when it still
; sucks
(setq tramp-verbose 10)
(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)
(setq explicit-shell-file-name "/bin/bash")

; Configure doom-modeline
(setq doom-modeline-project-detection 'project)
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
(setq doom-modeline-ic9on (display-graphic-p))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-majormode-color-icon t)
