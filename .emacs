(require 'package)

(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; edts                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/Users/niklasaholm/.emacs.d/edts")
(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start))
(setq edts-inhibit-package-check 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elpy                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(elpy-enable)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; deft                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'deft)

(setq deft-directory "~/docs/deft")

(setq deft-extensions '("org"))

(setq deft-default-extension "org")

(setq deft-text-mode 'org-mode)

(setq deft-use-filename-as-title t)

(setq deft-use-filter-string-for-filename t)

(setq deft-auto-save-interval 0)

(global-set-key (kbd "C-c d") 'deft)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; recentf                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; projectile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erlang macros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun rebar3-ct-suite ()
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (compile (format "rebar3 ct --suite %s" (erlang-get-module)))))

(defun rebar3-ct-case ()
  (interactive)
  (erlang-beginning-of-function)
  (let ((default-directory (projectile-project-root)))
    (compile (format "rebar3 ct --suite %s --case %s"
                     (erlang-get-module)
                     (erlang-get-function-name)))))

(defun rebar3-eunit ()
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (compile (format "rebar3 eunit -v --module %s"
                     (erlang-get-module)))))

(defun insert-ct-test (str)
  (interactive "sEnter function name: ")
  (insert str "({init, Config})  -> Config;\n")
  (insert str "({'end', Config}) -> Config;\n")
  (insert str "(Config)          -> ok.")
)

;; color theme
(load-theme 'nord t)

;; set cmd key to meta
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq default-input-method "MacOSX")

;; copy/paste ctrl+c/ctrl+v
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

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
