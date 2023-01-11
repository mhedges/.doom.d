;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! zenburn-theme)
(package! exec-path-from-shell)
(package! treemacs-icons-dired)
(package! org-super-agenda)
(package! org-superstar)
(package! flycheck-clang-tidy)
(package! multi-vterm)
(package! emms)
(package! ob-mermaid)
(package! org-ref)

(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
;(package! ox-extra)

;; When using org-roam via the `+roam` flag
(unpin! org-roam company-org-roam)

;; When using bibtex-completion via the `biblio` module
(unpin! bibtex-completion helm-bibtex ivy-bibtex)


;;; Turn off stock packages
(disable-packages! org-bullets)
