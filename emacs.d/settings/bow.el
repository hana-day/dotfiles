;; On bash on windows, use win32yank.exe for the use of clipboard.
;; Note that put "win32yank.exe" under the place where Windows user can
;; access (e.g. /mnt/c/Users/hoge/win32yankdir/).
(when (and (executable-find "uname")
           (executable-find "win32yank.exe")
           (string-match-p "Microsoft"
                           (shell-command-to-string "uname -r")))
  (setq interprogram-paste-function
        (lambda ()
          (replace-regexp-in-string
           "\r" "" (shell-command-to-string "win32yank.exe -o"))))
  (setq interprogram-cut-function
        (lambda (text &optional rest)
          (let* ((process-connection-type nil)
                 (proc (start-process
                        "win32yank-cut" "*Messages*" "win32yank.exe" "-i")))
            (process-send-string proc text)
            (process-send-eof proc)))))
