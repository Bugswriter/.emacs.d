;; bugswriter's minimal emacs config

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)
(setq use-file-dialog nil)

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
  (setq dashboard-startup-banner "~/.emacs.d/img/avatar.png")
  (setq dashboard-banner-logo-title "I am just a coder for fun"))

(use-package doom-themes
  :if window-system
  :ensure t
  :init
  (load-theme 'doom-dark+ t))

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "j" "k" "l"))
  :bind
  ([remap other-window] . switch-window))

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode))

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

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 50)
  :bind
  ("M-g" . magit-status))


(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package key-chord
  :ensure t
  :config
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  :init
  (key-chord-mode 1))
