;(require 'litable)
;(load (expand-file-name "~/.emacs.d/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;;(add-to-list 'load-path "/usr/share/common-lisp/source/slime/")
;;(setq inferior-lisp-program "/usr/bin/sbcl")
;;(load (expand-file-name "~/.emacs.d/slime-helper.el"))
(use-package slime
  :ensure t
  :defer t
  :config
  (progn
    (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
    (add-hook 'lisp-mode-hook
	      (lambda ()
		(set (make-local-variable 'lisp-indent-function)
		     'common-lisp-indent-function)
		(sp-pair "`" nil :actions :rem)))
    (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
    (slime-setup)
    (slime-setup '(slime-fancy slime-asdf slime-banner))
    (setq slime-complete-symbol*-fancy t)
    (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))



(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)

(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interation-hook 'enable-paredit-mode)

(add-hook 'inferior-scheme-mode-hook 'enable-paredit-mode)


(autoload 'scheme-smart-complete "scheme-complete" nil t)
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\t" 'scheme-complete-or-indent))

;; (use-package cluck
;;   :ensure t
;;   :defer t
;;   :config (setq cluck-fontify-style nil))

;;;;;;;;;; Clojure ;;;;;;;;;;;;;;;;
(use-package clojure-mode
  :ensure t
  :ensure clojure-mode-extra-font-locking
  :ensure cider
  :ensure paredit
  :defer t
;;  :mode ("\\.edn$" "\\.boot$" "\\.cljs.*$" ("lein.env" . enh-ruby-mode))
  :config
  (progn
	(add-hook 'clojure-mode-hook 'paredit-mode)
	(add-hook 'clojure-mode-hook 'subword-mode)
	;; A little more syntax highlighting
	(require 'clojure-mode-extra-font-locking)))
;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(eval-after-load 'cider
  '(progn
	 (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
	 (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
	 (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))
