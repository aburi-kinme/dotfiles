;; Init
;;; package.el
(require 'package)
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")))
(setq package-check-signature nil) 
(unless package-archive-contents
  (package-refresh-contents))

;;; use-package
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)

;;; init-loader
(use-package init-loader
  :ensure t
  :config
  (init-loader-load "~/.emacs.d/emacs"))
