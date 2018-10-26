;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GLSL (OpenGL) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.tesc\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.tese\\'" . glsl-mode))

(setq auto-mode-alist (cons '("\.cl$" . c-mode) auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; START C-common BLOCK ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
;;(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

;;; HELM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package setup-helm
;;   :ensure helm
;;   ;; this variables must be set before load helm-gtags
;;   ;; you can change to any prefix key of your choice
;;   :config (setq helm-gtags-prefix-key "\C-cg"))

;; (use-package helm-gtags
;;   :ensure t
;;   :init
;;   (progn
;;     (setq
;;      helm-gtags-ignore-case t
;;      helm-gtags-auto-update t
;;      helm-gtags-use-input-at-cursor t
;;      helm-gtags-pulse-at-cursor t
;;      helm-gtags-suggested-key-mapping t)

;; ;;     ;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; ;;     ;; when navigate project tree with Dired
;;      (add-hook 'dired-mode-hook 'helm-gtags-mode)

;; ;;     ;; Enable helm-gtags-mode in Eshell for the same reason as above
;;      (add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; ;;     ;; Enable helm-gtags-mode in languages that GNU Global supports
;;      (add-hook 'c-mode-hook 'helm-gtags-mode)
;;      (add-hook 'c++-mode-hook 'helm-gtags-mode)
;;      (add-hook 'java-mode-hook 'helm-gtags-mode)
;;      (add-hook 'asm-mode-hook 'helm-gtags-mode))

;;    :config
;;    (progn
;;      ;; key bindings
;;      (bind-key "M-s" 'helm-gtags-select helm-gtags-mode-map)
;;      (bind-key "M-." 'helm-gtags-find-tag helm-gtags-mode-map)
;;      (bind-key "M-," 'helm-gtags-pop-stack helm-gtags-mode-map)
;;      (bind-key "C-c <" 'helm-gtags-previous-history helm-gtags-mode-map)
;;      (bind-key "C-c >" 'helm-gtags-next-history helm-gtags-mode-map)))

;; FUNCTION ARGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package function-args
;;   :ensure t
;;   :init
;;   (fa-config-default)
;;   :config
;;   (define-key c-mode-map  [(alt tab)] 'moo-complete)
;;   (define-key c++-mode-map  [(alt tab)] 'moo-complete))


;;; MAGIT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit
  :ensure t
  :init
  (autoload 'magit-status "magit" nil t)
  :bind ("C-x g" . magit-status))

;;; STYLE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq c-auto-newline 1) ;; auto newline after curly, semicolon, etc
(setq-default c-default-style "k&r"
			  tab-width 4
			  c-basic-offset 4) ;; Linux indentation, tab = 4
(setq guess-offset-quiet-p t)

;; Use on the fly syntax check
;(add-hook 'c-mode-common-hook
;	  (lambda ()
;	    (flymake-mode t)))

;;; Show function name, in which you are located
(add-hook 'c-mode-common-hook
  (lambda ()
    (which-function-mode t)))


;;; Add doxygen support
;(require 'doxymacs)
;(add-hook 'c-mode-common-hook'doxymacs-mode)
;(defun my-doxymacs-font-lock-hook ()
;  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;      (doxymacs-font-lock)))
;(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;;; Highlight FIXME/TODO/etc...in c common mode
(add-hook 'c-mode-common-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\)" 1 font-lock-warning-face t)))))

;;;Switch header and source in c common
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)
     (local-set-key  (kbd "C-c b") 'compile)))


(setq shell-file-name "/bin/bash")
;;; Tagging (gtags) function and commands
;; (defun gtags-create ()
;;   "create or update the gnu global tag file"
;;   (interactive)
;;   (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
;;     (let ((olddir default-directory)
;;           (topdir (read-directory-name
;;                     "gtags: top of source tree:" default-directory)))
;;       (cd topdir)
;;       (shell-command "gtags && echo 'created tagfile'")
;;       (cd olddir)) ; restore
;;     ;;  tagfile already exists; update it
;;     (shell-command "global -u && echo 'updated tagfile'")))

;; (defun gtags-update ()
;;   "Update gtags, intended for automatic use on startup"
;;   (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
;; 	()
;; 	(shell-command "global -u && echo 'updated tagfile'")))

;; (add-hook 'gtags-mode-hook
;;   (lambda()
;;     (local-set-key (kbd "M-.") 'gtags-find-tag)   ; find a tag, also M-.
;;     (local-set-key (kbd "M-,") 'gtags-find-rtag)))  ; reverse tag

;; (add-hook 'c-mode-common-hook
;;   (lambda ()
;;     (require 'gtags)
;;     (gtags-mode t)
;; 	(gtags-update)))
