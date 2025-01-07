;;; Complete
;;;; vertico
(use-package vertico
  :ensure t
  :custom
  (setq vertico-count 20)
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  :init
  (vertico-mode))
;;;; savehist
(use-package savehist
  :ensure t
  :init
  (savehist-mode))
;;;; consult
(use-package consult
  :ensure t
  :config
  ;;;;; replace default buffer search (C-s)
  (global-set-key (kbd "C-s") 'consult-line)
  (define-key vertico-map (kbd "C-r") 'vertico-previous)
  (define-key vertico-map (kbd "C-s") 'vertico-next)
  ;;;;; replace default goto line (M-g g)
  (global-set-key [remap goto-line] 'consult-goto-line)
  ;;;;; replace default find file (C-x C-f)
  (global-set-key [remap find-file] 'consult-find))
;;;; orderless
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
;;;; marginalia
(use-package marginalia
  :ensure t
  :bind
  (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))
