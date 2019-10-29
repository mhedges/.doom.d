;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here



; Load zenburn theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/.local/straight/build/zenburn-theme/")
(load-theme 'zenburn t)

; Set font
(set-face-font 'default "Hack Nerd Font")

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

; Configure emacs to find binaries installed with homebrew
;(getenv "PATH")
;(setenv "PATH"
;		(concat
;		  "/usr/local/bin" ":"
;
;(getenv"PATH")))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
  (exec-path-from-shell-copy-env "PATH")
