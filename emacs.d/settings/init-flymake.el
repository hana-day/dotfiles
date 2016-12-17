(require 'flymake)
(setq flymake-gui-warnings-enabled nil)

(defvar flymake-enable-hooks '(php-mode-hook
                               ruby-mode-hook))

(dolist (hook flymake-enable-hooks)
  (add-hook hook '(lambda () (flymake-mode t))))

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
