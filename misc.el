(use-package recentf
  :defer t
  :ensure t
  :init
  (recentf-mode 1)
  (setq recentf-max-menu-items 30)
  (run-at-time nil (* 5 60) 'recentf-save-list)
  :bind (("C-x C-r" . recentf-open-files)))

;; Sentence should start after only one space
(setq sentence-end-double-space nil)
(global-linum-mode 1)
(desktop-save-mode 1)
(savehist-mode 1)
(add-to-list 'savehist-additional-variables 'kill-ring)

(setenv "PATH" (concat "/home/sebas/.local/bin" (getenv "PATH")))
(setq exec-path (append exec-path '("/home/sebas/.local/bin")))

(setenv "PATH" (concat "/home/sebas/.cargo/bin" (getenv "PATH")))
(setq exec-path (append exec-path '("/home/sebas/.cargo/bin")))

;; Turn off alarm/screen flashing
(setq ring-bell-function 'ignore)
(diminish 'auto-revert-mode)

;; Change reftex-var to markdown-pandoc format TODO: do this more cleanly
(eval-after-load 'reftex-vars
  '(progn
     (setq reftex-cite-format '((?\C-m . "[@%l]")))))
(add-hook 'markdown-mode-hook 'reftex-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)

;;Setup Projectile for project management
(use-package projectile
  :ensure t
  :defer t
  :init
  (progn
    (setq projectile-keymap-prefix (kbd "C-c p"))
    (setq projectile-completion-system 'default)
    (setq projectile-enable-caching t)
    (projectile-global-mode))
  :config
  (setq projectile-mode-line '(:eval (format "[%s]" (projectile-project-name)))))

(use-package perspective
  :ensure t
  :init
  (persp-mode))

;; Configure Ivy, a helm alternative. TODO compare
(use-package ivy :ensure t
  :ensure counsel-spotify
  :ensure avy
  :ensure counsel
  :ensure counsel-projectile
  :diminish (ivy-mode . "")
  :bind
  (("C-'" . ivy-avy)
   ("C-s" . swiper)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-c g" . counsel-git)
   ("C-c j" . counsel-git-grep)
   ("C-c k" . counsel-ag)
   ("C-x l" . counsel-locate))
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  (setq ivy-height 15)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
	;; allow input not in order
        '((t   . ivy--regex-ignore-order)))
  (setq magit-completing-read-function 'ivy-completing-read)
  (counsel-projectile-on))

(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (use-package treemacs-evil
      :ensure t
      :demand t)
    (setq treemacs-follow-after-init          t
          treemacs-width                      28
          treemacs-indentation                2
          treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-silent-refresh             nil
          treemacs-change-root-without-asking nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-show-hidden-files          t
          treemacs-never-persist              nil
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index)

    (treemacs-follow-mode t)
    (treemacs-tag-follow-mode t)
    (setq treemacs-tag-follow-delay 1.0)
    (treemacs-filewatch-mode t)
	(treemacs-git-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ([f8]         . treemacs-toggle)
        ("M-0"        . treemacs-select-window)
        ("C-c 1"      . treemacs-delete-other-windows)
        ("C-c tn"     . treemacs-toggle)
        ("C-c tN"     . treemacs)
        ("C-c tB"     . treemacs-bookmark)
        ("C-c t C-t"  . treemacs-find-file)
        ("C-c t M-t"  . treemacs-find-tag)))

(use-package treemacs-projectile
  :defer t
  :ensure t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header)
  :bind (:map global-map
              ("C-c tT" . treemacs-projectile)
              ("C-c tt" . treemacs-projectile-toggle)))

(save-place-mode 1)

(global-set-key (kbd "M-/") 'hippie-expand)

(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(setq save-interprogram-paste-before-kill t
	  apropos-do-all t
	  mouse-yank-at-point t
	  require-final-newline t
	  visible-bell t
	  load-prefer-newer t
	  ediff-window-setup-function 'ediff-setup-windows-plain
	  save-place-file (concat user-emacs-directory "places")
	  backup-directory-alist `(("." . ,(concat user-emacs-directory
											   "backups"))))

(defun my/vsplit-last-buffer (prefix)
  "Split the window vertically and display the previous buffer."
  (interactive "p")
  (split-window-vertically)
  (other-window 1 nil)
  (if (= prefix 1)
    (switch-to-next-buffer)))
(defun my/hsplit-last-buffer (prefix)
  "Split the window horizontally and display the previous buffer."
  (interactive "p")
  (split-window-horizontally)
  (other-window 1 nil)
  (if (= prefix 1) (switch-to-next-buffer)))
(bind-key "C-x 2" 'my/vsplit-last-buffer)
(bind-key "C-x 3" 'my/hsplit-last-buffer)

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :defer t
  :init
  (global-undo-tree-mode)
  :bind (("C-z" . undo-tree-undo)
		 ("C-S-z" . undo-tree-redo)))

;; Jump to last place of point
(global-set-key (kbd "C-x p") 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)

(diminish 'hs-minor-mode)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
(add-hook 'scheme-mode-hook     'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)

(use-package fold-dwim
  :ensure t
  :defer t
  :bind (("<f7>" . fold-dwim-toggle)
		 ("<C-f7>" . fold-dwim-hide-all)
		 ("<S-C-f7>" . fold-dwim-show-all)))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :defer t
  :init (smartparens-global-mode t)
  :config (sp-pair "'" nil :actions :rem))

(sp-local-pair 'c++-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
(defun my-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; iBuffer configuration ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ibuffer
  :ensure t
  :defer t
  :config
  (progn
	(setq ibuffer-saved-filter-groups
		  (quote (("default"
				   ("emacs" (or
							 (name . "^\\*scratch\\*$")
							 (name . "^\\*Messages\\*$")))
				   ("Org" ;; all org-related buffers
					(mode . org-mode))
				   ("Mail"
					(or  ;; mail-related buffers
					 (mode . message-mode)
					 (mode . mail-mode)
					 ;; etc.; all your mail related modes
					 ))
				   ("Programming" ;; prog stuff not already in MyProjectX
					(or
					 (mode . c-mode)
					 (mode . perl-mode)
					 (mode . python-mode)
					 (mode . emacs-lisp-mode)
					 (mode . haskell-mode)
					 ;; etc
					 ))
				   ("ERC"   (mode . erc-mode))))))
	(add-hook 'ibuffer-mode-hook
			  (lambda ()
				(ibuffer-switch-to-saved-filter-groups "default"))))
  :bind ("C-x C-b" . ibuffer))

;; cycle through buffers with Ctrl-Tab (like Firefox)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-buffer)

(use-package windmove
  :ensure t
  :bind (("M-H" . windmove-left)
		 ("M-K" . windmove-up)
		 ("M-L" . windmove-right)
		 ("M-J" . windmove-down)))

;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
    See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "C-o") 'open-next-line)

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current one.
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "M-o") 'open-previous-line)

;; Autoindent open-*-lines
(defvar newline-and-indent t
  "Modify the behavior of the open-*-line functions to cause them to autoindent.")

;;Linewise killing and yanking
(put 'kill-ring-save 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))
(put 'kill-region 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))
(defadvice kill-ring-save (around slick-copy activate)
  "When called interactively with no active region, copy a single line instead."
  (if (or (use-region-p) (not (called-interactively-p)))
      ad-do-it
    (kill-new (buffer-substring (line-beginning-position)
								(line-beginning-position 2))
			  nil '(yank-line))
    (message "Copied line")))
(defadvice kill-region (around slick-copy activate)
  "When called interactively with no active region, kill a single line instead."
  (if (or (use-region-p) (not (called-interactively-p)))
      ad-do-it
    (kill-new (filter-buffer-substring (line-beginning-position)
									   (line-beginning-position 2) t)
			  nil '(yank-line))))

(defun yank-line (string)
  "Insert STRING above the current line."
  (beginning-of-line)
  (unless (= (elt string (1- (length string))) ?\n)
    (save-excursion (insert "\n")))
  (insert string))

;; Trying to recreate vim *
(use-package highlight-symbol
  :ensure t
  :defer t
  :bind (("C-*" . highlight-symbol-next)
		 ("C-x *" . highlight-symbol-prev)))

(use-package minimap :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Define SmartScan search
(defvar smart-use-extended-syntax nil
  "If t the smart symbol functionality will consider extended
syntax in finding matches, if such matches exist.")

(defvar smart-last-symbol-name ""
  "Contains the current symbol name.

This is only refreshed when `last-command' does not contain
either `smart-symbol-go-forward' or `smart-symbol-go-backward'")

(make-local-variable 'smart-use-extended-syntax)

(defvar smart-symbol-old-pt nil
  "Contains the location of the old point")

(defun smart-symbol-goto (name direction)
  "Jumps to the next NAME in DIRECTION in the current buffer.

DIRECTION must be either `forward' or `backward'; no other option
is valid."

  ;; if `last-command' did not contain
  ;; `smart-symbol-go-forward/backward' then we assume it's a
  ;; brand-new command and we re-set the search term.
  (unless (memq last-command '(smart-symbol-go-forward
                               smart-symbol-go-backward))
    (setq smart-last-symbol-name name))
  (setq smart-symbol-old-pt (point))
  (message (format "%s scan for symbol \"%s\""
                   (capitalize (symbol-name direction))
                   smart-last-symbol-name))
  (unless (catch 'done
            (while (funcall (cond
                             ((eq direction 'forward) ; forward
                              'search-forward)
                             ((eq direction 'backward) ; backward
                              'search-backward)
                             (t (error "Invalid direction"))) ; all others
                            smart-last-symbol-name nil t)
              (unless (memq (syntax-ppss-context
                             (syntax-ppss (point))) '(string comment))
                (throw 'done t))))
    (goto-char smart-symbol-old-pt)))

(defun smart-symbol-go-forward ()
  "Jumps forward to the next symbol at point"
  (interactive)
  (smart-symbol-goto (smart-symbol-at-pt 'end) 'forward))

(defun smart-symbol-go-backward ()
  "Jumps backward to the previous symbol at point"
  (interactive)
  (smart-symbol-goto (smart-symbol-at-pt 'beginning) 'backward))

(defun smart-symbol-at-pt (&optional dir)
  "Returns the symbol at point and moves point to DIR (either `beginning' or `end') of the symbol.

If `smart-use-extended-syntax' is t then that symbol is returned
instead."
  (with-syntax-table (make-syntax-table)
    (if smart-use-extended-syntax
        (modify-syntax-entry ?. "w"))
    (modify-syntax-entry ?_ "w")
    (modify-syntax-entry ?- "w")
    ;; grab the word and return it
    (let ((word (thing-at-point 'word))
          (bounds (bounds-of-thing-at-point 'word)))
      (if word
          (progn
            (cond
             ((eq dir 'beginning) (goto-char (car bounds)))
             ((eq dir 'end) (goto-char (cdr bounds)))
             (t (error "Invalid direction")))
            word)
        (error "No symbol found")))))

(global-set-key (kbd "M-n") 'smart-symbol-go-forward)
(global-set-key (kbd "M-p") 'smart-symbol-go-backward)


(defun get-above-makefile () (expand-file-name
	   "Makefile" (loop as d = default-directory then (expand-file-name
	   ".." d) if (file-exists-p (expand-file-name "Makefile" d)) return
	   d)))

;; bind compiling with get-above-makefile to f5
(global-set-key [f5] (lambda () (interactive) (compile (format
	   "make -f %s" (get-above-makefile)))))
