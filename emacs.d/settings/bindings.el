(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "M-%") 'replace-regexp)

(global-set-key (kbd "C-x t") 'eshell)
(global-set-key (kbd "C-x C-t") 'multi-term)

(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-c g") 'magit-status)

;; cua
(define-key cua-global-keymap (kbd "C-x C-@") 'cua-set-rectangle-mark)
(define-key cua-global-keymap (kbd "C-@") 'cua-set-mark)

(global-set-key (kbd "M-k") 'copy-line)
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

