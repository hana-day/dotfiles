(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (define-key emacs-lisp-mode-map (kbd "C-c C-l")
               '(lambda () (interactive) (load-file buffer-file-name)))))
