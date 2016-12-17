(require 'paredit)
(show-paren-mode 1)
(defvar enable-paredit-mode-hooks '(emacs-lisp-mode-hook
                                    lisp-interacton-mode-hook
                                    lisp-mode-hook
                                    scheme-mode-hook
                                    clojure-mode-hook))
(dolist (hook enable-paredit-mode-hooks)
  (add-hook hook 'enable-paredit-mode))
