(add-to-list 'auto-mode-alist
             '("\\.\\(html\\|erb\\|css\\|vue\\|jsx\\)$" . web-mode))
(add-hook 'web-mode-hook '(lambda ()
                            (setq web-mode-markup-indent-offset 2)))
