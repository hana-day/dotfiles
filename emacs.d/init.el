(require 'cl)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(defvar my-packages '(paredit
                      auto-complete
                      zenburn-theme
                      magit
                      web-mode
                      php-mode
                      js2-mode
                      flymake-ruby
                      smex
                      yaml-mode
                      multi-term
                      yasnippet
                      go-mode
                      markdown-mode
                      editorconfig
                      dockerfile-mode
                      smartparens))

(package-initialize)


(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))


;; color theme
(load-theme 'zenburn t)


;; font setting
(add-to-list 'default-frame-alist '(font . "Ricty-12"))


(setq command-line-default-directory "~")


;; better default
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)
(setq ido-auto-merge-work-directories-length -1)

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(column-number-mode t)
(show-paren-mode t)
(setq show-paren-delay 0)
(fset 'yes-or-no-p 'y-or-n-p)
(set-default 'tags-case-fold-search nil)

(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      ring-bell-function 'ignore
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))


;; browser setting
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")


;; tetris
(setq tetris-score-file "~/.emacs.d/tetris-scores")

;; cua mode
(cua-mode t)
(setq cua-enable-cua-keys nil)                               


;; autocomplete
(require 'auto-complete)
(setq ac-auto-show-menu nil)
(global-auto-complete-mode t)


;; smex
(require 'smex)
(smex-initialize)


;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)


;; use PATH in zsh
(let ((shellenv-file (concat user-emacs-directory "shellenv.el")))
  (when (file-exists-p shellenv-file)
    (load-file shellenv-file)
    (dolist (path (reverse (split-string (getenv "PATH") ":")))
      (add-to-list 'exec-path path))
    (put 'upcase-region 'disabled nil)))


;; my subsettings!
(mapc 'load (directory-files (concat user-emacs-directory "settings")
                             t "^[^#].*el$"))

;; load environment-specific settings
(let ((init-local-file (concat user-emacs-directory "init-local.el")))
  (when (file-exists-p init-local-file)
    (load-file init-local-file)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smartparens zenburn-theme yasnippet yaml-mode web-mode thrift smex scss-mode php-mode paredit multi-term markdown-mode magit less-css-mode js2-mode go-mode flymake-ruby dockerfile-mode cmake-mode auto-complete)))
 '(safe-local-variable-values
   (quote
    ((c-file-offsets
      (innamespace . 0)
      (substatement-open . 0)
      (c . c-lineup-dont-change)
      (inextern-lang . 0)
      (comment-intro . c-lineup-dont-change)
      (arglist-cont-nonempty . c-lineup-arglist)
      (block-close . 0)
      (statement-case-intro . ++)
      (brace-list-intro . ++)
      (cpp-define-intro . +))
     (c-auto-align-backslashes))))
 '(yas-trigger-key "TAB"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
