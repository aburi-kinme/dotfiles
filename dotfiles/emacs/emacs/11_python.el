;;; Python
;;;; python-mode
(use-package python-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook #'company-mode)
  (add-hook 'python-mode-hook #'eglot-ensure)
  :config
  (define-key python-mode-map (kbd "C-.") 'xref-find-definitions)
  (define-key python-mode-map (kbd "C-,") 'xref-pop-marker-stack))
