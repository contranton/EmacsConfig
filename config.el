
(require 'server)
(unless (server-running-p)
  (cond
   ((eq system-type 'windows-nt)
    (setq server-auth-dir "~\\.emacs.d\\server\\"))
   ((eq system-type 'gnu/linux)
    (setq server-auth-dir "~/.emacs.d/server/")))
  (server-start))

(require 'package)  
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-refresh-contents)
  (require 'use-package)


  ;; Set Use-Package to ALWAYS DEFER loading
  (setq use-package-always-defer t)


;; htmlize for org exports
(use-package htmlize
  :ensure t)

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

  ;; Realgud for better debugging
  (use-package realgud
    :ensure t)


  ;; isend to send regions to code interpreters
  (use-package isend-mode
    :ensure t)

  (use-package imenu-list
   :ensure t
   :bind ("C-'" . 'imenu-list-smart-toggle))

  ;; Pdf viewer
  ;;(use-package pdf-tools
  ;;  :ensure t
  ;;)

  ;; Python babeeey
  (use-package elpy
    :ensure t
    :init (progn
            (elpy-enable))
    )

  
(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

(use-package yasnippet-snippets
 :ensure t)


;; Rainboooows
(use-package rainbow-mode
 :ensure t)

(use-package rainbow-delimiters
 :ensure t)

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

  ;; Helm and projectile
  (use-package projectile
    :ensure t
    :init
    (projectile-global-mode)
    (setq projectile-completion-system 'ivy)
    )

  ;; Simultaenous editing
  (use-package iedit
    :ensure t)

  (use-package powerline
   :ensure t)

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (plantuml . t)
   (python . t)
   ))

(setq org-plantuml-jar-path
    (expand-file-name "~/plantuml.jar"))

(add-hook 'org-babel-after-execute-hook
          'org-display-inline-images)

(use-package org-trello
  :ensure t)

;; (setq tab-always-indent)
(setq backup-directory-alist '(("." . "~/.saves/")))
(setq python-shell-interpreter "ipython")
(add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")

;; Enable ansi colors in ipython shell
(setq ansi-color-for-comint-mode t)

;; Disable the use of line-move-partial
;; This hopefully reduces navigation lag
(setq auto-window-vscroll nil)

;; Magit keybindings
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

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
(use-package gruvbox-theme
 :ensure t
 :init 
  (load-theme 'gruvbox-dark-soft)
  )

(use-package grandshell-theme
 :ensure t)
(tool-bar-mode -1)

;; ido for better completions
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Set which buffers should be opened on the same window
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

(bind-key (kbd "C-x C-b") 'ibuffer)

;; Turn off alert bell sound
(setq visible-bell 1)

;; File encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

;; Page refresh keybinding
(global-set-key (kbd "<f5>") 'revert-buffer)


;; Reload PATH when running emacsclient
(defun my-update-env ()
  (interactive)
  (let ((str 
         (with-temp-buffer
           (insert-file-contents "env.txt")
           (buffer-string))) lst)
    (setq lst (split-string str "\000"))
    (while lst
      (setq cur (car lst))
      (when (string-match "^\\(.*?\\)=\\(.*\\)" cur)
        (setq var (match-string 1 cur))
        (setq value (match-string 2 cur))
        (setenv var value))
      (setq lst (cdr lst)))))

;; Start server only in the daemon instance
 (when (and (daemonp) (locate-library "edit-server"))
   (require 'edit-server)
   (edit-server-start))

 ;; Hack to fix gmail compose window
 (use-package edit-server-htmlize
  :ensure t
  :config
    (autoload 'edit-server-maybe-dehtmlize-buffer "edit-server-htmlize" "edit-server-htmlize" t)
    (autoload 'edit-server-maybe-htmlize-buffer   "edit-server-htmlize" "edit-server-htmlize" t)
    (add-hook 'edit-server-start-hook 'edit-server-maybe-dehtmlize-buffer)
    (add-hook 'edit-server-done-hook  'edit-server-maybe-htmlize-buffer)
  )

(delete-selection-mode 1)
(workgroups-mode 1)
(global-origami-mode 1)
(global-visual-line-mode 1)
(projectile-mode 1)

(global-hl-line-mode t)
(global-linum-mode t)

(add-hook 'prog-mode-hook 'flycheck-mode)

(require 'verilog-mode)
(setq verilog-compiler 'iverilog)

(global-set-key (kbd "M-[") (kbd "C-x 8 '"))