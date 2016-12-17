(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "bsd")
            (setq c-basic-offset 4)
            ;; offset of multiline
            (c-set-offset 'statement-cont 'c-lineup-math)
            (setq show-trailing-whitespace t)))


;; markdown
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; slime
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy))


;; web-mode
(add-to-list 'auto-mode-alist
             '("\\.\\(html\\|erb\\|css\\|vue\\|jsx\\)$" . web-mode))
(add-hook 'web-mode-hook '(lambda ()
                            (setq web-mode-markup-indent-offset 2)))

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))
(add-hook 'js2-mode-hook
          (lambda () (setq show-trailing-whitespace t)))


;; flymake
(require 'flymake)
(setq flymake-gui-warnings-enabled nil)

(defvar flymake-enable-hooks '(php-mode-hook
                               ruby-mode-hook))

(dolist (hook flymake-enable-hooks)
  (add-hook hook '(lambda () (flymake-mode t))))

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)


;; paredit
(require 'paredit)
(show-paren-mode 1)
(defvar enable-paredit-mode-hooks '(emacs-lisp-mode-hook
                                    lisp-interacton-mode-hook
                                    lisp-mode-hook
                                    scheme-mode-hook
                                    clojure-mode-hook))
(dolist (hook enable-paredit-mode-hooks)
  (add-hook hook 'enable-paredit-mode))

;; inf-ruby
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; arduino
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))

;; php-mode
(require 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(setq php-mode-force-pear t)

;; emacs lisp
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (define-key emacs-lisp-mode-map (kbd "C-c C-l")
               '(lambda () (interactive) (load-file buffer-file-name)))))

;;; yasnippets
(require 'yasnippet)
(add-hook 'latex-mode-hook 'yas-minor-mode)
(yas-global-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
(custom-set-variables '(yas-trigger-key "TAB"))


;;; multi-term-mode
(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

;;; go-mode
(setenv "GOPATH" "~/ws/go")
