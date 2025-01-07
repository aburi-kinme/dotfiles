;;; Go
;;;; go-mode
(use-package go-mode
  :ensure t
  :init
  (add-hook 'go-mode-hook #'company-mode)
  (add-hook 'go-mode-hook #'eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (define-key go-mode-map (kbd "C-.") 'xref-find-definitions)
  (define-key go-mode-map (kbd "C-,") 'xref-pop-marker-stack))
