(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(load-theme 'dracula t)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; silence bell
(setq ring-bell-function 'ignore)

;; ;; set cmd key to meta
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq default-input-method "MacOSX")

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

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
