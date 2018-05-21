
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'org)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e88abed2a39b47dfedb1272066f214cb2c9db28ee6aa1794bfb27948792f81c0" "42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" default)))
 '(package-selected-packages
   (quote
    (matlab-emacs sr-speedbar ob-plantuml htmlize gnugo edit-server-htmlize grandshell gruvbox yasnippet-snippets workgroups2 use-package realgud rainbow-mode rainbow-delimiters projectile powerline origami org-trello multiple-cursors magit isend-mode imenu-list iedit hungry-delete flycheck elpy aggressive-indent ace-window)))
 '(safe-local-variable-values
   (quote
    ((eval add-hook
	   (quote after-save-hook)
	   (lambda nil
	     (org-babel-tangle))
	   nil t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
