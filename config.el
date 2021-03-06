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


  (use-package counsel
    :ensure t
    :config
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (setq ivy-re-builders-alist
    '((ivy-switch-buffer . ivy--regex-plus)
      (t . ivy--regex-fuzzy)))
    :bind
    (;("\C-s" . swiper)
     ("\C-c C-s" . counsel-ag)
     ("C-c C-r" . ivy-resume)
     ("<f6>" . ivy-resume)
     ("M-x" . counsel-M-x)
     ("C-x C-f" . counsel-find-file)
     ("<f1> f" . counsel-describe-function)
     ("<f1> v" . counsel-describe-variable)
     ("<f1> l" . counsel-find-library)
     ("<f2> i" . counsel-info-lookup-symbol)
     ("<f2> u" . counsel-unicode-char))
    )

  ;; Set Use-Package to ALWAYS DEFER loading
  (setq use-package-always-defer t)


  ;; PlantUML mode for org class diagram goodness
  (use-package plantuml-mode
    :ensure t)


  ;; SrSpeedbar for DOCKED SPEEDBAR OMG
  (use-package sr-speedbar
    :ensure t
    :bind ("C-c s" . 'sr-speedbar-toggle))

  ;; flx and flx-ido for Fuzzy completions

  (use-package flx-ido
    :ensure t
    :init
    (ido-mode 1)
    (ido-everywhere 1)
    (flx-ido-mode 1)
    ;; disable ido faces to see flx highlights.
    (setq ido-enable-flex-matching t)
    (setq ido-use-faces nil))

  ;; htmlize for org exports
  (use-package htmlize
    :ensure t)

  ;; Expand-Region keybind
  (use-package expand-region
    :ensure t
    :bind ("C-=" . er/expand-region))

  ;; Origami
  (use-package origami
    :ensure t
    :bind ( "C-<tab>" . origami-recursively-toggle-node)
    )

  ;; Magit
  (use-package magit
    :ensure t
    :init (setq exec-path (append exec-path '("C:/Program Files/Git/bin")))
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
	    (elpy-enable)
	    (setq elpy-shell-use-project-root nil)
	    )
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
(setq flycheck-check-syntax-automatically '(save mode-enable))
    )

  ;; Helm and projectile
  (use-package projectile
    :ensure t
    :init
    (setq projectile-completion-system 'ivy)
    )

  ;; Simultaenous editing
  (use-package iedit
    :ensure t)

(setq python-shell-interpreter "ipython")
(add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (plantuml . t)
   (python . t)
   (ipython .t)
   ))

(setq ob-ipython-resources-dir "~\.emacs.d\ob-ipython-resources")
(setq org-src-window-setup 'current-frame)
(setq org-confirm-babel-evaluate nil)
(setq org-plantuml-jar-path
      (expand-file-name "~/plantuml.jar"))

(add-hook 'org-babel-after-execute-hook
	  'org-display-inline-images)

(use-package org-trello
'  :ensure t)

;; TODO states
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING" "|" "WORKING" "|" "DONE" )))


;; Latex Preview'
(defvar kk/org-latex-fragment-last nil
    "Holds last fragment/environment you were on.")

  (defun kk/org-in-latex-fragment-p ()
    "Return the point where the latex fragment begins, if inside
  a latex fragment. Else return false"
    (let* ((el (org-element-context))
	   (el-type (car el)))
      (and (or (eq 'latex-fragment el-type) (eq 'latex-environment el-type))
	  (org-element-property :begin el))))

  (defun kk/org-latex-fragment-toggle ()
    "Toggle a latex fragment image "
    (and (eq 'org-mode major-mode)
	 (let ((begin (kk/org-in-latex-fragment-p)))
	   (cond
	    ;; were on a fragment and now on a new fragment
	    ((and
	      ;; fragment we were on
	      kk/org-latex-fragment-last
	      ;; and are on a fragment now
	      begin

	      ;; but not on the last one this is a little tricky. as you edit the
	      ;; fragment, it is not equal to the last one. We use the begin
	      ;; property which is less likely to change for the comparison.
	      (not (and kk/org-latex-fragment-last
			(= begin
			   kk/org-latex-fragment-last))))
	     ;; go back to last one and put image back, provided there is still a fragment there
	     (save-excursion
	       (goto-char kk/org-latex-fragment-last)
	       (when (kk/org-in-latex-fragment-p) (org-preview-latex-fragment))

	       ;; now remove current image
	       (goto-char begin)
	       (let ((ov (loop for ov in (org--list-latex-overlays)
			       if
			       (and
				(<= (overlay-start ov) (point))
				(>= (overlay-end ov) (point)))
			       return ov)))
		 (when ov
		   (delete-overlay ov)))
	       ;; and save new fragment
	       (setq kk/org-latex-fragment-last begin)))

	    ;; were on a fragment and now are not on a fragment
	    ((and
	      ;; not on a fragment now
	      (not begin)
	      ;; but we were on one
	      kk/org-latex-fragment-last)
	     ;; put image back on, provided that there is still a fragment here.
	     (save-excursion
	       (goto-char kk/org-latex-fragment-last)
	       (when (kk/org-in-latex-fragment-p) (org-preview-latex-fragment)))

	     ;; unset last fragment
	     (setq kk/org-latex-fragment-last nil))

	    ;; were not on a fragment, and now are
	    ((and
	      ;; we were not one one
	      (not kk/org-latex-fragment-last)
	      ;; but now we are
	      begin)
	     ;; remove image
	     (save-excursion
	       (goto-char begin)
	       (let ((ov (loop for ov in (org--list-latex-overlays)
			       if
			       (and
				(<= (overlay-start ov) (point))
				(>= (overlay-end ov) (point)))
			       return ov)))
		 (when ov
		   (delete-overlay ov))))
	     (setq kk/org-latex-fragment-last begin))))))

;; (setq tab-always-indent)
(setq backup-directory-alist '(("." . "~/.saves/")))


;; Enable ansi colors in ipython shell
(setq ansi-color-for-comint-mode t)

;; Set python M-q indentation mode
(setq python-fill-docstring-style 'symmetric)

;; Disable the use of line-move-partial
;; This hopefully reduces navigation lag
(setq auto-window-vscroll nil)

;; Encoding for copy pasting text in windows
(set-selection-coding-system 'utf-16-le)

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
  )

(use-package grandshell-theme
 :ensure t)
(tool-bar-mode -1)

(load-theme 'grandshell)

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
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)


;; Reload PATH when running emacsclient
(defun my-update-env (fn)
  (let ((str 
	 (with-temp-buffer
	   (insert-file-contents fn)
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

(desktop-save-mode)

(delete-selection-mode 1)
(workgroups-mode 1)
(global-origami-mode 1)
(global-visual-line-mode 1)
(projectile-mode 1)
(toggle-truncate-lines)

(global-hl-line-mode t)
(global-linum-mode 0)

(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'linum-mode)

(require 'verilog-mode)
(setq verilog-compiler 'iverilog)

(global-set-key (kbd "C-x c") 'whitespace-cleanup)

(custom-set-variables
'(jdee-server-dir "C:\\Users\\Javier\\Desktop\\Polytechnique\\PolyGit\\jdee-server"))

(setq ispell-program-name "C:\\MinGW\\hunspell\\bin\\hunspell")

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)
