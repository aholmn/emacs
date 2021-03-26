;; always remember
;; C-x C-e

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(load-theme 'plan9 t)

;; silence bell
(setq ring-bell-function 'ignore)

;; set cmd key to meta
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq default-input-method "MacOSX")

;; remove go to background
(global-unset-key [(control x)(control z)])

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; show line numbers
(global-linum-mode t)
(eval-after-load "linum"
'(set-face-attribute 'linum nil :height 100))

;; show columns
(setq column-number-mode t)

;; hide menu
(tool-bar-mode -1)

;; set starting screen to *scratch*
(setq inhibit-startup-screen t)

;; start screen in maximized mode
(toggle-frame-maximized)

;; macros
(defun open-notes ()
  (interactive)
  (find-file "~/Documents/notes.org"))

(defun goto-git-folder ()
  (interactive)
  (find-file "~/git"))


(defun open-todos ()
  (interactive)
  (find-file "~/Documents/todos.org"))

;; custom mappings
(global-set-key (kbd "C-c C-p") 'projectile-find-file)
(global-set-key (kbd "C-c C-n") 'open-notes)
(global-set-key (kbd "C-c C-g") 'goto-git-folder)
(global-set-key (kbd "C-c C-t") 'open-todos)

(global-unset-key "\C-l")
(global-unset-key "\C-z")

;; for a better erlang environment
(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'erlang-mode)

(require 'erlang)
(require 'lsp-mode)
(require 'reformatter)
(require 'lsp-ui)
(require 'which-key)

(reformatter-define erlang-format
  :program "erlfmt"
  :args '("-"))

(add-hook 'erlang-mode-hook 'erlang-format-on-save-mode)

(define-key erlang-mode-map
  (kbd "C-c C-f") 'erlang-format-buffer)

(define-key lsp-mode-map
  (kbd "C-c C-r") 'lsp-find-references)

(add-hook 'erlang-mode-hook #'lsp)

(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-position 'at-point)

(add-hook 'erlang-mode-hook 'which-key-mode)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; move custom defined variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((allout-layout . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; init ends heere
