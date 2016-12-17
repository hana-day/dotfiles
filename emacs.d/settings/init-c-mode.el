(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "bsd")
            (setq c-basic-offset 4)
            ;; offset of multiline
            (c-set-offset 'statement-cont 'c-lineup-math)
            (setq show-trailing-whitespace t)))
