(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    anzu
    company
    duplicate-thing
    ggtags
    helm
    helm-gtags
    helm-projectile
    helm-swoop
    clean-aindent-mode
    comment-dwim-2
    dtrt-indent
    ws-butler
    iedit
    yasnippet
    yasnippet-snippets
    magit
    smartparens
    projectile
    volatile-highlights
    undo-tree
    zenburn-theme
    xcscope
    zygospore
    ace-window
    ) "a list of packages to ensure are installed at launch.")

(dolist (package required-packages)
  (unless (package-installed-p package)
    (package-install package))
     (require package))
