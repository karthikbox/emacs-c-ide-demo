(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defconst demo-packages
  '(anzu
    company
    duplicate-thing
    ggtags
    helm
    helm-gtags
    helm-projectile
    helm-swoop
    ;; function-args
    magit
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
    bookmark+
    zenburn-theme
    xcscope
    zygospore
    ace-window
    ) "a list of packages to ensure are installed at launch.")

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package demo-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)
