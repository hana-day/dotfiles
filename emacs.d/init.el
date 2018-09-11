(require 'cl)


(setq settings-dir
      (expand-file-name "settings/" user-emacs-directory))

(add-to-list 'load-path settings-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (concat settings-dir "custom.el"))
(load custom-file)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(defvar my-packages '(paredit
                      auto-complete
                      zenburn-theme
                      magit
                      web-mode
                      smex
                      yaml-mode
                      multi-term
                      yasnippet
                      go-mode
                      markdown-mode
                      editorconfig
                      dockerfile-mode
                      smartparens
                      cython-mode))

(package-initialize)


(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))


(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; color theme
(load-theme 'zenburn t)


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


;; browser setting
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")


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
