;; General
(use-package emacs
  :config
  ;;; system
  ;;;; message
  (setq initial-scratch-message nil)
  (setq inhibit-startup-message t)
  ;;;; custom
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  ;;;; final newline
  (setq require-final-newline t)
  ;;;; tmp file output
  (setq my-backup-dir (expand-file-name "tmp" user-emacs-directory))
  (setq backup-directory-alist `((".*" . ,my-backup-dir)))
  ;;; UI
  ;;;; paren
  (show-paren-mode t)
  (setq show-paren-style 'mixed)
  ;;;; bar mode
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  ;;;; theme
  (load-theme 'wombat t)
  ;;; Key Binding
  ;;;; global
  (global-set-key (kbd "C-h") 'delete-backward-char))
