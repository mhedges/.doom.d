;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

; Load zenburn theme
(load-theme 'zenburn t)

;; Set font (I don't know if this actually works)
(setq doom-font (font-spec :family "Hack Nerd Font" :size 12))

;; Set vterm to use zsh
(setq vterm-shell "/bin/zsh")

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

; Org-superstar bullets
(setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))

(setq org-agenda-files '("~/org/logbook"
            "~/org/logbook/archive/2019"
            "~/org/logbook/archive/2020"
            "~/org/roam"))
;; Set minted for org
;; (setq org-latex-pdf-process
;;  '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; (add-to-list 'org-latex-packages-alist '("minted"))
;; (setq org-latex-listings 'minted)

;; Setup emms
(setq emms-source-file-default-directory "~/Music/music_library")
(emms-all)
(emms-default-players)
(setq emms-player-list (list emms-player-mpv))
;; Set emms key bindings
(map! :leader
      :map emms-playlist-mode-map
      "e SPC" #'emms-pause
      "e n"   #'emms-next
      "e p"   #'emms-previous
      "e e"   #'emms
      )
