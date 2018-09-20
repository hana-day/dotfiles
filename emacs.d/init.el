(require 'cl)
(require 'package)


(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t))


;; Keep the installed packages in emacs.d/elpa directory.
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(package-initialize)


;; Update the package information if the local cache is missing.
(unless package-archive-contents
  (package-refresh-contents))

(package-initialize)


;; Create the savefile directory
(defconst hyusuk-savefile-dir (expand-file-name "savefile" user-emacs-directory))
(unless (file-exists-p hyusuk-savefile-dir)
  (make-directory hyusuk-savefile-dir))


;; Load newer .el or .elc
(setq load-prefer-newer t)

(setq command-line-default-directory "~")

;; Disable tool/screen bars
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(blink-cursor-mode -1)

;; Disable ringing bell but display it.
(setq ring-bell-function 'ignore)
(setq visible-bell t)

(setq inhibit-startup-screen t)

;; Mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(setq require-final-newline t)

;; Delete the selection with a keypress
(delete-selection-mode t)

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; Show matting parentheses
(show-paren-mode t)
(setq show-paren-delay 0)

(setq-default indent-tabs-mode nil)

;; Enable copy and paste
(setq x-select-enable-clipboard t
      x-select-enable-primary t)

;; Save clipboard text into kill ring before replaceing it.
(setq save-interprogram-paste-before-kill t)


(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "M-%") 'replace-regexp)

(global-set-key (kbd "C-x t") 'shell)

(global-set-key (kbd "M-*") 'pop-tag-mark)

(global-set-key (kbd "M-k") 'copy-line)
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "C-x C-m C-m") 'compile)


(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package ido
  :config
  (setq ido-everywhere t)
  (setq ido-enable-flex-matching t)
  (setq ido-auto-merge-work-directories-length -1)
  (ido-mode t))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package saveplace
  :config
  (setq save-place-file (expand-file-name "saveplace" hyusuk-savefile-dir))
  (setq-default save-place t))

(use-package etags
  :config
  (set-default 'tags-case-fold-search nil))

(use-package auto-complete
  :ensure t
  :config
  (setq ac-auto-show-menu nil)
  (global-auto-complete-mode t))

(use-package smex
  :ensure t
  :bind (("M-x" . smex))
  :config
  (smex-initialize))

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq ediff-split-window-function 'split-window-horizontally))

(use-package browse-url
  :config
  (setq browse-url-browser-function 'browse-url-generic)
  (setq browse-url-generic-program "google-chrome"))

(use-package cc-mode
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (c-set-style "bsd")
              (setq c-basic-offset 4)
              ;; offset of multiline
              (c-set-offset 'statement-cont 'c-lineup-math)
              (setq show-trailing-whitespace t))))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package lisp-mode
  :config
  (add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (define-key emacs-lisp-mode-map (kbd "C-c C-l")
               '(lambda () (interactive) (load-file buffer-file-name))))))

(use-package eshell
  :config
  (setq eshell-history-size 10000)
  (setq eshell-hist-ignoredups t))

(use-package go-mode
  :ensure t
  :config
  (setenv "GOPATH" "~/ws/go"))

(use-package markdown-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

(use-package multi-term
  :ensure t
  :bind (("C-x C-t" . multi-term))
  :config
  (add-hook 'term-mode-hook (lambda()
                              (setq yas-dont-activate t))))

(use-package paredit
  :ensure t
  :config
  (show-paren-mode 1)
  (defvar enable-paredit-mode-hooks '(emacs-lisp-mode-hook
                                      lisp-interacton-mode-hook
                                      lisp-mode-hook
                                      scheme-mode-hook
                                      clojure-mode-hook))
  (dolist (hook enable-paredit-mode-hooks)
    (add-hook hook 'enable-paredit-mode)))

(use-package python
  :config
  (setq python-shell-interpreter "python3"))

(use-package smartparens
  :ensure t
  :config
  (setq sp-autoescape-string-quote nil)
  (--each '(python-mode-hook
            js-mode-hook
            c-mode-hook
            c++-mode-hook
            java-mode
            ruby-mode
            web-mode-hook
            latex-mode-hook
            go-mode-hook)
          (add-hook it 'turn-on-smartparens-mode)))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist
               '("\\.\\(html\\|erb\\|css\\|vue\\|jsx\\|js\\|php\\)$" . web-mode))
  (add-hook 'web-mode-hook '(lambda ()
                              (setq web-mode-markup-indent-offset 2)
                              (setq web-mode-auto-close-style t)
                              (setq web-mode-tag-auto-close-style t)
                              (setq web-mode-enable-auto-pairing t))))

(use-package yasnippet
  :ensure t
  :config
  (add-hook 'latex-mode-hook 'yas-minor-mode)
  (yas-global-mode 1)
  (custom-set-variables '(yas-trigger-key "TAB")))

(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))


;; Japanese input settings
(setenv "LANG" "ja_JP.UTF-8")
(add-hook 'set-language-environment-hook 
          (lambda ()
            (when (equal "ja_JP.UTF-8" (getenv "LANG"))
              (prefer-coding-system 'utf-8)
              (setq default-file-name-coding-system 'utf-8))
            (when (equal "Japanese" current-language-environment)
              (setq default-buffer-file-coding-system 'utf-8))))
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")


;; use PATH in zsh
(let ((shellenv-file (concat user-emacs-directory "shellenv.el")))
  (when (file-exists-p shellenv-file)
    (load-file shellenv-file)
    (dolist (path (reverse (split-string (getenv "PATH") ":")))
      (add-to-list 'exec-path path))
    (put 'upcase-region 'disabled nil)))


;; load environment-specific settings
(let ((init-local-file (concat user-emacs-directory "init-local.el")))
  (when (file-exists-p init-local-file)
    (load-file init-local-file)))


;; On bash on windows, use win32yank.exe for the use of clipboard.
;; Note that put "win32yank.exe" under the place where Windows user can
;; access (e.g. /mnt/c/Users/hoge/win32yankdir/).
(when (and (executable-find "uname")
           (executable-find "win32yank.exe")
           (string-match-p "Microsoft"
                           (shell-command-to-string "uname -r")))
  (setq interprogram-paste-function
        (lambda ()
          (replace-regexp-in-string
           "\r" "" (shell-command-to-string "win32yank.exe -o"))))
  (setq interprogram-cut-function
        (lambda (text &optional rest)
          (let* ((process-connection-type nil)
                 (proc (start-process
                        "win32yank-cut" "*Messages*" "win32yank.exe" "-i")))
            (process-send-string proc text)
            (process-send-eof proc)))))


;; Config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))
