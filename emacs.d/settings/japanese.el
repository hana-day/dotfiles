(setenv "LANG" "ja_JP.UTF-8")
(add-hook 'set-language-environment-hook 
          (lambda ()
            (when (equal "ja_JP.UTF-8" (getenv "LANG"))
              (prefer-coding-system 'utf-8)
              (setq default-file-name-coding-system 'utf-8))
            (when (equal "Japanese" current-language-environment)
              (setq default-buffer-file-coding-system 'utf-8))))

;; japanese input method
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

