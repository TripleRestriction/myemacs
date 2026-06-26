(setq custom-file (expand-file-name "~/.custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
(load (expand-file-name "real.el" user-emacs-directory))
