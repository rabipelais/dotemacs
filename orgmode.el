
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Org mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'org-install)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key (kbd "C-c o") 'org-capture)
(setq org-log-done t)

(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "<C-tab>") 'next-buffer)
	    (local-set-key (kbd "<C-M-tab>") 'org-force-cycle-archived)))

;;(org-remember-insinuate)
(setq org-directory "~/.emacs.d/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file+headline "~/.emacs.d/org/notes.org" "Tasks")
               "* TODO %?\n %i\nAdded: %U %a\n")
              ("p" "project" entry (file+headline "~/.emacs.d/org/notes.org" "Projects")
               "* %? :PROJECT:\nAdded: %U\n")
              ("r" "reading" entry (file+headline "~/.emacs.d/org/notes.org" "Projects")
               "* %? :READING:\nAdded: %U\n")
              )))

