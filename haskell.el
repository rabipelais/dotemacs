(use-package shm
  :ensure t
  :config
  (progn
	(define-key shm-map (kbd "C-c C-s") 'shm/case-split)
	(define-key shm-map (kbd "M-d") 'my/shm/kill-word)
	(define-key shm-map (kbd "C-d") 'my/shm/delete-char)
	(define-key shm-map (kbd "<backspace>") 'my/shm/backward-delete-char)))

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode)
  (add-hook 'haskell-mode-hook
			(lambda ()
			  (add-hook 'before-save-hook 'haskell-mode-stylish-buffer nil 'make-it-local))))

(defun haskell-style ()
  "Sets the current buffer to use Haskell Style. Meant to be
added to `haskell-mode-hook'"
  (interactive)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4
		shm-indent-spaces 4
		shm-indent-point-after-adding-where-clause t))


;; "Smart" deletion for shm
(defun my/shm/backward-delete-char ()
  "Kill the word backwards."
  (interactive)
  (let ((to-be-deleted (save-excursion (backward-char)
                                       (point))))
    (save-excursion
      (shm-adjust-dependents (point) (* -1 (- (point) to-be-deleted))))
    (backward-delete-char-untabify 1)))

(defun my/shm/delete-char ()
  "Kill the word backwards."
  (interactive)
  (let ((to-be-deleted (save-excursion (forward-char)
                                       (point))))
    (save-excursion
      (shm-adjust-dependents (point) (* 1 (- (point) to-be-deleted))))
    (delete-char 1)))

(defun my/shm/kill-word ()
  "Kill the word backwards."
  (interactive)
  (let ((to-be-deleted (save-excursion (forward-word)
                                       (point))))
    (save-excursion
      (shm-adjust-dependents (point) (* 1 (- (point) to-be-deleted))))
    (kill-word 1)))


;; Custom do-block indentation
(eval-after-load "shm"
  '(defun shm-auto-insert-do ()
	 "Insert template

  do
{undefined}
{undefined}
"
	 (shm-newline-indent t)
	 (let ((point (point))
		   (column (current-column)))
	   (insert "undefined")
	   (cond
		((bound-and-true-p structured-haskell-repl-mode)
		 (forward-word -1)
		 (shm/reparse)
		 (save-excursion
		   (shm-evaporate (point) (+ (point) (length "undefined")))))
		(t (shm-newline-indent t)
		   (let ((next-point (point)))
			 (insert "undefined")
			 (goto-char point)
			 (shm/reparse)
			 (save-excursion
			   (shm-evaporate (point) (+ (point) (length "undefined")))
			   (goto-char next-point)
			   (shm-evaporate (point) (+ (point) (length "undefined"))))))))))

(defun w3m-maybe-url ()
  (interactive)
  (if (or (equal '(w3m-anchor) (get-text-property (point) 'face))
          (equal '(w3m-arrived-anchor) (get-text-property (point) 'face)))
      (w3m-view-this-url)))
(add-hook 'w3m-display-hook 'w3m-haddock-display)
(setq haskell-w3m-haddock-dirs
  '("~/.cabal/share/doc/"))

;; EXTRA FUNCTIONS
;; ------------
(defun haskell-interactive-toggle-print-mode ()
  (interactive)
  (setq haskell-interactive-mode-eval-mode
        (intern
         (ido-completing-read "Eval result mode: "
                              '("fundamental-mode"
                                "haskell-mode"
                                "espresso-mode"
                                "ghc-core-mode"
                                "org-mode")))))

(defun haskell-insert-doc ()
  "Insert the documentation syntax."
  (interactive)
  (insert "-- | "))

(defun haskell-insert-undefined ()
  "Insert undefined."
  (interactive)
  (if (and (boundp 'structured-haskell-mode)
           structured-haskell-mode)
      (shm-insert-string "undefined")
    (insert "undefined")))

(defun haskell-move-right ()
  (interactive)
  (haskell-move-nested 1))

(defun haskell-move-left ()
  (interactive)
  (haskell-move-nested -1))

(defun haskell-process-cabal-build-and-restart ()
  "Build and restart the Cabal project."
  (interactive)
  (cond
   (t
    (haskell-process-cabal-build)
    (haskell-process-queue-without-filters
     (haskell-process)
     (format ":!cd %s && scripts/restart\n" (haskell-session-cabal-dir (haskell-session)))))
   (t (turbo-devel-reload))))

(defun haskell-who-calls (&optional prompt)
  "Grep the codebase to see who uses the symbol at point."
  (interactive "P")
  (let ((sym (if prompt
                 (read-from-minibuffer "Look for: ")
               (haskell-ident-at-point))))
    (let ((existing (get-buffer "*who-calls*")))
      (when existing
        (kill-buffer existing)))
    (let ((buffer
           (grep-find (format "cd %s && find . -name '*.hs' -exec grep -inH -e %s {} +"
                              (haskell-session-current-dir (haskell-session))
                              sym))))
      (with-current-buffer buffer
        (rename-buffer "*who-calls*")
        (switch-to-buffer-other-window buffer)))))

(defun haskell-auto-insert-module-template ()
  "Insert a module template for the newly created buffer."
  (interactive)
  (when (and (= (point-min)
                (point-max))
             (buffer-file-name))
    (insert
     "-- | "
     "\n"
     "\n"
     "module " (haskell-guess-module-name) " where"
     "\n"
     "\n")
    (goto-char (point-min))
    (forward-char 5)))
