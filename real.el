(load-theme 'wombat t)
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq make-backup-files nil)
(setq scroll-conservatively 101)
(setq-default indent-tabs-mode nil)
(set-face-attribute 'default nil :family "JetBrains Mono Nerd Font" :height 120 :weight 'normal)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)
(setq display-line-numbers-width-start t)
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
(use-package evil)
(evil-mode 1)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
(electric-pair-mode 1)
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)
  (corfu-cycle t)
  :init
  (global-corfu-mode))
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
