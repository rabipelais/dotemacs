;; my elisp directories
;(defvar elisp-path '("~/.emacs.d/lisp"))
;(mapcar #'(lambda(p) (add-to-list 'load-path p)) elisp-path)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;;(when
 ;;   (load
 ;;    (expand-file-name "~/.emacs.d/elpa/package.el"))
 ;; (package-initialize))
;; (require 'package)
;; (unless (assoc-default "melpa" package-archives)
;;   (set-default 'package-archives (cons '("melpa" . "http://melpa.org/packages/") package-archives))
;;   (package-refresh-contents))
;; (package-initialize)


(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;(let ((default-directory "~/.emacs.d/lisp/"))
;      (normal-top-level-add-subdirs-to-load-path))

;;; Set the default dir for backups
(push '("." . "~/.emacs.d/emacs-backups") backup-directory-alist)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(require 'use-package)


;;; Remembers last place of point in a file
(setq save-place-file "~/.emacs.d/saveplace") ;; keep my ~/ clean
(setq-default save-place t)
(require 'saveplace)
(require 'erc)


;;; configuration for bookmarks
(setq
  bookmark-default-file "~/.emacs.d/bookmarks" ;; keep my ~/ clean
  bookmark-save-flag 1);; autosave each change)

(use-package winner
  :ensure t
  :init
  (progn
	(setq winner-dont-bind-my-keys t) ;; default bindings conflict with org-mode
	(global-set-key (kbd "<f9>") 'winner-undo)
	(global-set-key (kbd "S-<f9>") 'winner-redo)
	(winner-mode t)))


;;; higlight changes in documents
(global-highlight-changes-mode t)
(diminish 'highlight-changes-mode)
(setq highlight-changes-visibility-initial-state nil); initially hide
;; toggle visibility
(global-set-key (kbd "<f6>")      'highlight-changes-visible-mode) ;; changes
;; remove the change-highlight in region
(global-set-key (kbd "S-<f6>")    'highlight-changes-remove-highlight)
(set-face-foreground 'highlight-changes nil)
(set-face-background 'highlight-changes "#382f2f")
(set-face-foreground 'highlight-changes-delete nil)
(set-face-background 'highlight-changes-delete "#916868")

(require 'uniquify)

;(global-linum-mode 1)
(setq tab-width 4)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq inhibit-startup-message t
	  inhibit-startup-echo-area-message t)
(define-key global-map (kbd "RET") 'newline-and-indent)

(fset 'yes-or-no-p 'y-or-n-p)

(use-package list-register
  :bind ("C-x r v" . list-register))
