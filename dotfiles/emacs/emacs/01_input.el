;;; Input
;;;; xclip
(use-package xclip
  :ensure t
  :config
  (xclip-mode t)
  (xterm-mouse-mode t))
;;;; company
(use-package company
  :ensure t
  :defer t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-s") 'company-abort)
  (define-key company-active-map (kbd "C-j") 'company-complete-selection))
;;;; flycheck
(use-package flycheck
  :ensure t
  :defer t)
;;;; eglot
(use-package eglot
  :ensure t)  
;;;; vterm
;(use-package vterm
;  :ensure t
;  :config
;  (define-key vterm-mode-map (kbd "C-g") 'vterm--self-insert))
