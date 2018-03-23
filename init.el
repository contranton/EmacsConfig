



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(package-refresh-contents)

;; Expand-Region keybind
(use-package expand-region
  :bind ("C-=" . 'er/expand-region))

;; Origami
(use-package origami
  :ensure t
  :bind ( "C-<tab>" . origami-recursively-toggle-node) 
  )

;; Magit
(use-package magit
  :ensure t
  )

;; Pdf viewer
;;(use-package pdf-tools
;;  :ensure t
;;)

;; Python babeeey
(use-package elpy
  :ensure t
  :init (progn
          (elpy-enable)
          (elpy-use-ipython))
  )

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

;; Relative line numbers keybind
(use-package linum-relative
  :bind ("C-M-`" . linum-relative-mode))

;; Hook Jedi to Python-Mode
;; (use-package jedi
;;   :ensure t
;;   :hook ('python-mode-hook . 'jedi:setup)
;;   :config (setq jedi:complete-on-dot t))

;; smart-tab
;; (use-package smart-tab
;;   :ensure t
;;   :config (global-smart-tab-mode 1))

;; Avy
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char-2))

;; Ace-window for numbered C-x o
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    )
  )

;; Multiple-Cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . 'mc/edit-lines)
         ("C->" . 'mc/mark-next-like-this)
         ("C-<" . 'mc/mark-previous-like-this)
         ("C-c C-<" . 'mc/mark-all-like-this)
         ))

;; workgroups2
(use-package workgroups2
  :ensure t
  :config (progn
            (setq wg-prefix-key (kbd "C-c z"))
            (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
            (global-set-key (kbd "<pause>")     'wg-reload-session)
            (global-set-key (kbd "C-S-<pause>") 'wg-save-session)
            (global-set-key (kbd "s-z")         'wg-switch-to-workgroup)
            (global-set-key (kbd "s-/")         'wg-switch-to-previous-workgroup)
            ))

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode))

(use-package aggressive-indent
  :ensure t
  :config (global-aggressive-indent-mode 1))

;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t)
  )

;; Swiper and Counsel
(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    )
  )

(use-package iedit
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
  (python . t)
   ;; other languages..
   )
 )

;; (setq tab-always-indent)
(setq backup-directory-alist '(("." . "~/.saves/")))
(setq python-shell-interpreter "ipython")
(add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")

;; Windmove (Shift-arrws instead of C-x O)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; WinnerMode (Allows restoring of window configs)
(when (fboundp 'winner-mode)
  (winner-mode 1))

;;(defun my/dynamic-page-scroll-depth ()
;;  (setq next-screen-context-lines (/ (window-total-height) 5))
;;  )

;;(remove  'my/dynamic-page-scroll-depth 'window-scroll-functions)

(rainbow-mode)
(load-theme 'gruvbox-dark-soft)
(tool-bar-mode -1)
(global-hl-line-mode t)

;; ido for better completions
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Set which buffers should be opened on the same window
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

(bind-key (kbd "C-x M-b") 'ibuffer)

;; Turn off alert bell sound
(setq visible-bell 1)

;; File encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

;; Page refresh keybinding
(global-set-key (kbd "<f5>") 'revert-buffer)

(delete-selection-mode 1)
(desktop-save-mode 1)
(workgroups-mode 1)
(global-origami-mode 1)
(visual-line-mode 1)

(add-hook 'prog-mode-hook 'flycheck-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("82fce2cada016f736dbcef237780516063a17c2436d1ee7f42e395e38a15793b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
