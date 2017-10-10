(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(load "~/.emacs.d/my-loadpackages.el")
(load "~/.emacs.d/my-methods.el")
(load "~/.emacs.d/my-org.el")
