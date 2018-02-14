(add-to-list 'auto-mode-alist
             '("\\.\\(html\\|erb\\|css\\|vue\\|jsx\\|js\\|php\\)$" . web-mode))
(add-hook 'web-mode-hook '(lambda ()
                            (setq web-mode-markup-indent-offset 2)
                            (setq web-mode-auto-close-style t)
                            (setq web-mode-tag-auto-close-style t)
                            (setq web-mode-enable-auto-pairing t)))

