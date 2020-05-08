
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
 '(ansi-term-color-vector
   [unspecified "#1F1611" "#660000" "#144212" "#EFC232" "#5798AE" "#BE73FD" "#93C1BC" "#E6E1DC"])
 '(custom-safe-themes
   (quote
    ("d7383f47263f7969baf3856ab8b3df649eb77eafdff0c5731bee2ad18e0faed2" "4b19d61c560a93ef90767abe513c11f236caec2864617d718aa366618133704c" "af4dc574b2f96f5345d55b98af024e2db9b9bbf1872b3132bc66dffbf5e1ba1d" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "3860a842e0bf585df9e5785e06d600a86e8b605e5cc0b74320dfe667bcbe816c" "a5f068e6c26c2ed952096c034eb49f3ad15a329c905bf3475fae63c1ddb9f402" "88049c35e4a6cedd4437ff6b093230b687d8a1fb65408ef17bfcf9b7338734f6" "021720af46e6e78e2be7875b2b5b05344f4e21fad70d17af7acfd6922386b61e" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "a4df5d4a4c343b2712a8ed16bc1488807cd71b25e3108e648d4a26b02bc990b3" "e88abed2a39b47dfedb1272066f214cb2c9db28ee6aa1794bfb27948792f81c0" "42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" default)))
 '(default-input-method "latin-1-postfix")
 '(fci-rule-character-color "#452E2E")
 '(fci-rule-color "#452E2E")
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
    (darkroom subatomic256-theme birds-of-paradise-plus-theme django-theme wttrin org-bullets green-is-the-new-black-theme quasi-monochrome-theme darktooth-theme pdf-tools jupyter jdee eclim eimp image+ emoji-fontset nlinum auctex wc-mode wolfram-mode fireplace markdown-preview-eww json-mode plantuml-mode expand-region ob-ipython auto-yasnippet counsel dracula-theme flx-ido matlab-emacs sr-speedbar ob-plantuml htmlize gnugo edit-server-htmlize grandshell gruvbox yasnippet-snippets workgroups2 use-package realgud rainbow-mode rainbow-delimiters projectile powerline origami org-trello multiple-cursors magit isend-mode imenu-list iedit hungry-delete flycheck elpy aggressive-indent ace-window)))
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
