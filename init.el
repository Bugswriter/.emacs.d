;; bugswriter's minimal emacs config

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-dialog-box nil)
(setq use-file-dialog nil)

(global-display-line-numbers-mode 1)
(use-package doom-themes
  :if window-system
  :ensure t
  :config
  (load-theme 'doom-molokai t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (fringe-mode -1)
  (scroll-bar-mode -1))

(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono-12"))

(setq make-backup-files nil)
(setq auto-save-default nil)

(global-subword-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.emacs.d/avatar.jpg")
  (setq dashboard-banner-logo-title "I am just a coder for fun"))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

(use-package ox-reveal
  :ensure ox-reveal
  :config
  (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
  (setq org-reveal-mathjax t))

(use-package htmlize
  :ensure t)

(use-package evil
  :ensure t
  :config
  (evil-mode 1))
  
(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define-global "jk" 'evil-normal-state)
  (key-chord-define-global "kj" 'evil-normal-state))
