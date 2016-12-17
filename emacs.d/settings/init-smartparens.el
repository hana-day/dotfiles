(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(python-mode-hook
          js-mode-hook
          c-mode-hook
          c++-mode-hook
          java-mode
          ruby-mode
          web-mode-hook)
  (add-hook it 'turn-on-smartparens-mode))
