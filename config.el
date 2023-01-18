;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Set number of columns to 120, because it's the 21st century
(setq-default fill-column 120)
;; Set auto-fill to fill-column above
(add-hook 'text-mode-hook 'turn-on-auto-fill)

; Use zenburn theme
(setq doom-theme 'doom-one)

;; Set font (I don't know if this actually works)
(setq doom-font (font-spec :family "Hack" :size 12))

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

; Set org-mode files to overview mode
(setq org-startup-folded 't)

; Org-agenda files
(setq org-agenda-files '("~/org/logbook"
            "~/org/logbook/archive/2019"
            "~/org/logbook/archive/2020"
            "~/org/roam"))

;; Org-latex classes
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
    '("elsarticle"
    "\\documentclass{elsarticle}"
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )

(require 'ox-extra)
(ox-extras-activate '(ignore-headlines))

;(setq org-latex-pdf-process
;      '("pdflatex -interaction nonstopmode -output-directory %o %f"
;        "bibtex %b"
;        "pdflatex -interaction nonstopmode -output-directory %o %f"
;        "pdflatex -interaction nonstopmode -output-directory %o %f"))

;(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

;; Set plantuml stuff
; For macOS only
(setq org-plantuml-jar-path (expand-file-name "/usr/local/Cellar/plantuml/1.2020.12/libexec/plantuml.jar"))

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

; Mermaid diagrams
(setq ob-mermaid-cli-path "/usr/local/bin/mmdc")

;; Tweak some org stuff
(use-package-hook! org
  :pre-config
  ; Change Org elipses
  ; (setq org-ellipsis "⤵")

  ; Set new org-todo tags
  (setq org-todo-keywords
	'((sequence
		"📥(t)"    ; Task that needs to be done
		"👷🛠(s)"  ; Task that has been started
		"|"
		"🎉😎(d)"  ; Task has been completed
		"💀👻(k)"  ; Task has been killed without completion
		"|"
		"📅📝(m)"  ; Meeting
		"🤔💭(i)"  ; An idea or thought to be considered.  Could later become a task/project
		))
	org-todo-keyword-faces
	'(("👷🛠"  .  +org-todo-active)
	  )
	)
  nil

  (use-package! org-superstar
    :hook (org-mode . org-superstar-mode)
    )
  )

(use-package-hook! flycheck
  :pre-config
  (use-package! flycheck-clang-tidy
    :hook (flycheck-mode . flycheck-clang-tidy-setup)
    )
  )
