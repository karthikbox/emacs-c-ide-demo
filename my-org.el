;;   -*- mode: lisp  -*-

(setq org-directory "~/Google Drive/orgfiles/")

(setq org-agenda-files '("~/Google Drive/orgfiles/inbox.org"
                         "~/Google Drive/orgfiles/gtd.org"
                         "~/Google Drive/orgfiles/tickler.org"))

;; (setq org-capture-templates '(("t" "Todo [inbox]" entry
;;                                (file+headline "~/Google Drive/orgfiles/inbox.org" "Tasks")
;;                                "* TODO %i%?")
;;                               ("T" "Tickler" entry
;;                                (file+headline "~/Google Drive/orgfiles/tickler.org" "Tickler")
;;                                "* %i%? \n %U")))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/inbox.org") "Tasks")
         "* TODO %i%? \n")
        ("T" "Tickler" entry (file+headline (concat org-directory "/tickler.org") "Tickler")
         "* %i%? \n %U")
        ("l" "Link" plain (file (concat org-directory "/links.org"))
         "- %?\n %x\n")))

(setq org-refile-targets '(("~/Google Drive/orgfiles/gtd.org" :maxlevel . 3)
                           ("~/Google Drive/orgfiles/someday.org" :level . 1)
                           ("~/Google Drive/orgfiles/tickler.org" :maxlevel . 2)))

(define-key global-map "\C-cr" 'org-capture)
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-agenda-custom-commands
      '(("o" "At the office" tags-todo "@office"
         ((org-agenda-overriding-header "Office")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
        ("h" "At the office" tags-todo "@home"
         ((org-agenda-overriding-header "Home")
          (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))))

(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))

(define-key global-map "\C-ca" 'org-agenda)

(defun gtd ()
  (interactive)
  (find-file "~/Google Drive/orgfiles/inbox.org")
  )
(global-set-key (kbd "C-c g") 'gtd)
