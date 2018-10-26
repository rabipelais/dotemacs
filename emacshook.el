;(load "~/.emacs.d/dotemacs/cedetconf")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'cl)
(require 'cc-mode)

(require 'dash)
(use-package outshine
  :ensure t)

;; Required for outshine
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)

;; Enables outline-minor-mode for *ALL* programming buffers
(add-hook 'prog-mode-hook 'outline-minor-mode)

(load "~/.emacs.d/dotemacs/elpa")
;;(setq load-path (remove-if (lambda (x) (string-match-p "cedet" x)) load-path))
(add-to-list 'load-path "/usr/share/emacs/25.2/lisp/cedet")

(use-package company
  :ensure t
  :init (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

(load "~/.emacs.d/dotemacs/c-common")
(load "~/.emacs.d/dotemacs/python")
(load "~/.emacs.d/dotemacs/lisp")
(load "~/.emacs.d/dotemacs/haskell")
(load "~/.emacs.d/dotemacs/ocaml")

(load "~/.emacs.d/dotemacs/orgmode")
(load "~/.emacs.d/dotemacs/misc")
(load "~/.emacs.d/dotemacs/auctex")

;;(load "~/.emacs.d/dotemacs/modeline")
(load "~/.emacs.d/dotemacs/modeline-spaceline")
(load "~/.emacs.d/dotemacs/theming")


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;;(defun my-c-mode-cedet-ac-hook ()
;  (add-to-list 'ac-sources 'ac-source-gtags)
;  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-ac-hook)

(define-key ac-completing-map "\M-/" 'ac-stop)
(setq ac-dwim t)
;; Show 0.8 second later
(setq ac-auto-show-menu nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(use-package smart-tabs-mode
  :ensure t
  :config
  (smart-tabs-insinuate 'c 'c++))

(put 'compile-command 'safe-local-variable (lambda (xx) t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cargo-process--custom-path-to-bin "/home/sebas/.cargo/bin")
 '(cluck-fontify-style nil)
 '(company-ghc-show-info t)
 '(custom-safe-themes
   (quote
	("aaa019645671c074233a17f8b4c960627831754f340a4cc76ce1fa353ddf0728" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(ecb-options-version "2.40")
 '(flycheck-rust-executable nil)
 '(global-flycheck-mode t)
 '(haskell-process-args-cabal-repl (quote ("--ghc-option=-ferror-spans")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(org-agenda-files (quote ("~/.emacs.d/org/notes.org")))
 '(package-selected-packages
   (quote
	(auto-compile outshine flycheck-ghcmod flycheck-stack flymake-haskell-multi ghc haskell-mode hasky-stack jinja2-mode markdown-toc markdownfmt cider paredit clojure-mode-extra-font-locking toml-mode flycheck-rust rust racer cargo rust-mode perspective web-mode markdown-mode markdown-mode+ markdown-preview-eww markdown-preview-mode cmake-mode rainbow-mode treemacs-evil treemacs-projectile treemacs evil anzu spaceline-config spaceline-all-the-icons spaceline jedi ein py-autopep8 counsel-projectile zenburn-theme yaml-mode w3m use-package unicode-fonts undo-tree tuareg smartparens smart-tabs-mode slime shm shakespeare-mode python-mode pretty-mode ocp-indent nyan-mode minimap merlin magit lua-mode intero highlight-symbol helm-projectile helm-gtags helm-dash hamlet-mode hamburger-menu google-translate google function-args fold-dwim flymake-less flycheck-haskell elpy counsel-spotify counsel company-ghc clojure-mode clang-format avy auctex ac-anaconda)))
 '(racer-rust-src-path
   "/home/sebas/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")
 '(safe-local-variable-values
   (quote
	((reftex-default-bibliography "/home/sebas/Thesis/ma/citations/MA.bib")
	 (reftex-default-bibliography . "/home/sebas/Thesis/ma/citations/MA.bib")
	 (reftex-default-bibliography . "~/Thesis/ma/citations/MA.bib")
	 (reftex-default-bibliography quote
								  ("~/Thesis/ma/citations/MA.bib"))
	 (reftex-default-bibliography quote
								  ("citations/MA.bib"))
	 (intero-stack-yaml . "/home/sebas/Proggy/tiger/stack.yaml")
	 (hamlet/basic-offset . 4)
	 (haskell-process-use-ghci . t)
	 (haskell-indent-spaces . 4)
	 (org-todo-keyword-faces
	  ("PENDING" . "RoyalBlue")
	  ("TO_RENT" . "LightSlateGrey")
	  ("READING" . "yellow"))
	 (org-todo-keyword-faces
	  ("PENDING" . "DodgerBlue")
	  ("TO_RENT" . "LightSlateGrey")
	  ("READING" . "yellow"))
	 (org-todo-keyword-faces
	  ("PENDING" . "grey")
	  ("TO_RENT" . "blue")
	  ("READING" . "yellow"))
	 (org-todo-keyword-faces
	  ("TODO" . "grey")
	  ("READING" . "yellow"))
	 (org-todo-keyword-faces
	  ("READING" . "yellow"))
	 (eval setq project-root
		   (locate-dominating-file buffer-file-name ".dir-locals.el"))
	 (eval setq default-directory
		   (locate-dominating-file buffer-file-name ".dir-locals.el"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)

(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
