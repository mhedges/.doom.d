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

;;; Turn off stock packages
(disable-packages! org-bullets)
