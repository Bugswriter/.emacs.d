;; bugswriter's minimal emacs config

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package ewal					 ;;
;;   :init (setq ewal-use-built-in-always-p nil		 ;;
;;               ewal-use-built-in-on-failure-p t	 ;;
;;               ewal-built-in-palette "sexy-material")) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package ewal-spacemacs-themes	    ;;
;;   :if window-system			    ;;
;;   :ensure t				    ;;
;;   :init				    ;;
;;   (load-theme 'ewal-spacemacs-classic t) ;;
;;   (menu-bar-mode -1)			    ;;
;;   (tool-bar-mode -1)			    ;;
;;   (scroll-bar-mode -1)		    ;;
;;   (window-divider-mode 1))		    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package doom-themes
      :if window-system
      :ensure t
      :config
      (load-theme 'doom-dark+ t)
      (doom-themes-org-config)
      (doom-themes-visual-bell-config)
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (fringe-mode -1)
      (scroll-bar-mode -1))


(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono-11"))

(setq use-dialog-box nil)
(setq use-file-dialog nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

(global-subword-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.emacs.d/avatar.png")
  (setq dashboard-banner-logo-title "I am just a coder for fun"))

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

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 50)
  :bind
  ("M-g" . magit-status))

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

(use-package evil
  :ensure t)

(use-package key-chord
  :ensure t
  :config
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  :init
  (key-chord-mode 1))

(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" default))
 '(package-selected-packages
   '(company treemacs doom-themes use-package switch-window smex projectile org-bullets magit key-chord ido-vertical-mode hungry-delete ewal-spacemacs-themes evil emmet-mode dashboard)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
