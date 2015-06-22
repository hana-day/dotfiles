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

;;; racket
(setq geiser-active-implementations '(racket))
(setq geiser-racket-binary "/usr/bin/racket")
;; scheme setting
(setq scheme-program-name "mit-scheme")
(require 'cmuscheme)
(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

;; slime
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy))


;; web-mode
(add-to-list 'auto-mode-alist '("\\.\\(html\\|erb\\)$" . web-mode))

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
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
(custom-set-variables '(yas-trigger-key "TAB"))
