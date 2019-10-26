
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'org)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -file-line-error")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#333" "#ff5f87" "#3affa3" "#f6df92" "#b2baf6" "#c350ff" "#5af2ee" "#ccc"])
 '(custom-safe-themes
   (quote
    ("a5f068e6c26c2ed952096c034eb49f3ad15a329c905bf3475fae63c1ddb9f402" "88049c35e4a6cedd4437ff6b093230b687d8a1fb65408ef17bfcf9b7338734f6" "021720af46e6e78e2be7875b2b5b05344f4e21fad70d17af7acfd6922386b61e" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "a4df5d4a4c343b2712a8ed16bc1488807cd71b25e3108e648d4a26b02bc990b3" "e88abed2a39b47dfedb1272066f214cb2c9db28ee6aa1794bfb27948792f81c0" "42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" default)))
 '(default-input-method "latin-1-postfix")
 '(flx-ido-mode t)
 '(jdee-compile-option-command-line-args (quote ("-g")))
 '(jdee-global-classpath nil)
 '(jdee-server-dir
   "C:\\Users\\Javier\\Desktop\\Polytechnique\\PolyGit\\jdee-server")
 '(jdee-sourcepath
   (quote
    ("C:/Users/Javier/Desktop/Polytechnique/inf371/INF371/TD3")))
 '(package-selected-packages
   (quote
    (green-is-the-new-black-theme quasi-monochrome-theme darktooth-theme pdf-tools jupyter jdee eclim eimp image+ emoji-fontset nlinum auctex wc-mode wolfram-mode fireplace markdown-preview-eww json-mode plantuml-mode expand-region ob-ipython auto-yasnippet counsel dracula-theme flx-ido matlab-emacs sr-speedbar ob-plantuml htmlize gnugo edit-server-htmlize grandshell gruvbox yasnippet-snippets workgroups2 use-package realgud rainbow-mode rainbow-delimiters projectile powerline origami org-trello multiple-cursors magit isend-mode imenu-list iedit hungry-delete flycheck elpy aggressive-indent ace-window)))
 '(pdf-view-midnight-colors (quote ("#FDF4C1" . "#282828")))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(safe-local-variable-values
   (quote
    ((eval add-hook
	   (quote after-save-hook)
	   (lambda nil
	     (org-babel-tangle))
	   nil t))))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(put 'downcase-region 'disabled nil)
