(setq inhibit-startup-message t)
(setq package-install-upgrade-built-in t)
(global-hl-line-mode +1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(which-key-mode)
(setq make-backup-files nil)
(setq scroll-conservatively 101)
(setq scroll-margin 10)
(setq scroll-conservatively 101)
(setq-default indent-tabs-mode nil)
(set-face-attribute 'default nil :family "3270 Nerd Font Mono" :height 170 :weight 'bold)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)
(setq display-line-numbers-width-start t)
(setq display-line-numbers-width 5)
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
						  ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(require 'use-package)
(setq use-package-always-ensure t)
(use-package counsel)
(use-package ivy
  :ensure t
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d "
        ivy-initial-inputs-alist nil))
(setq evil-want-keybinding nil)
(use-package evil
  :ensure t)
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))
(use-package elfeed
  :ensure t
  :bind ("C-x w" . elfeed))

(setq elfeed-feeds
      '("https://www.bleepingcomputer.com/feed"
        "https://cyberscoop.com/feed/"
        "https://krebsonsecurity.com/feed/"))
(use-package doom-themes)
(use-package doom-themes)
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-default-dark t))
(evil-mode 1)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
(electric-pair-mode 1)
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 3)
  (corfu-cycle t)
  :init
  (global-corfu-mode))

(use-package project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)
(use-package company)
(use-package yasnippet)
(use-package go-mode)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")

(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure) ; install pylsp plugins for full functionality
(add-hook 'go-mode-hook 'eglot-ensure) ; install gopls
