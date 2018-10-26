
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; CEDET configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(load-file "~/.emacs.d/cedet/cedet-devel-load.el")
(load-file "~/.emacs.d/cedet/common/cedet.el")
;; ;; (add-to-list 'load--file "~/.emacs.d/cedet/common/cedet/cedet-devel-load.el")
;; (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;; (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
;; ;;(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
;; ;;(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)

;;;;;; SEMANTIC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

;(semantic-mode 1)



(semantic-load-enable-excessive-code-helpers)
;(require 'semantic/ia)
;(require 'semantic/bovine/gcc)

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(setq qt5-base-dir "/usr/include/qt5")
(semantic-add-system-include qt5-base-dir 'c++-mode)
(setq qt5-gl-dir "/usr/include/qt5/QtOpenGL/")
(semantic-add-system-include qt5-gl-dir 'c++-mode)
(setq qt5-gui-dir "/usr/include/qt5/QtGui/")
(semantic-add-system-include qt5-gui-dir 'c++-mode)
(setq qt5-core-dir "/usr/include/qt5/QtCore/")
(semantic-add-system-include qt5-core-dir 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt5-base-dir 'c++-mode))
(add-to-list 'auto-mode-alist (cons qt5-core-dir 'c++-mode))
(add-to-list 'auto-mode-alist (cons qt5-gui-dir 'c++-mode))
(add-to-list 'auto-mode-alist (cons qt5-gl-dir 'c++-mode))
;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt5-base-dir "/QtCore/qconfig.h"))
;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt5-base-dir "/QtCore/qconfig-dist.h"))
;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt5-base-dir "/QtCore/qglobal.h"))

;; support for gtags
(when (cedet-gnu-global-version-check t)
;  (require 'semanticdb-global)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))


;;; EDE
;(require 'ede)
;(global-ede-mode)

;(setq semantic-default-submodes
 ;     '(;; cache(?)
;
;
   ;     global-semantic-highlight-edits-mode
  ;      global-semantic-idle-local-symbol-highlight-mode
 ;       ;; global-cedet-m3-minor-mode
;
    ;    ;; code helpers
   ;     global-semantic-idle-scheduler-mode
  ;      global-semantic-idle-summary-mode
 ;       global-semantic-idle-completions-mode
;     ;   ;; eye candy
    ;    global-semantic-decoration-mode
   ;     global-semantic-highlight-func-mode
  ;      global-semantic-highlight-edits-mode
 ;       global-semantic-stickyfunc-mode
;
     ;   ;; debugging semantic itself
    ;    ;;global-semantic-show-parser-state-mode 1   ;; show the pars;ing state in the mode line
  ;      ;;global-semantic-show-unmatched-syntax-mode 1
 ;       ))

;(global-ede-mode t)



;;; Keybindings TODO: find out what the hell they do
(add-hook 'c-mode-common-hook
	  (lambda()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key (kbd "C-c >") 'semantic-complete-analyze-inline)
  (local-set-key (kbd "C-c p") 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "C-c =") 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key (kbd "C-c q") 'semantic-ia-show-doc)
  (local-set-key (kbd "C-c s") 'semantic-ia-show-summary)
;  (local-set-key (kbd "C-c +") 'semantic-tag-folding-show-block)
;  (local-set-key (kbd "C-c -") 'semantic-tag-folding-fold-block)
;  (local-set-key (kbd "C-c C-c +") 'semantic-tag-folding-show-all)
;  (local-set-key (kbd "C-c C-c -") 'semantic-tag-folding-fold-all)
  (define-key c-mode-base-map (kbd "C-c m") 'eassist-list-methods)))

(defun my-c-mode-cedet-hook ()
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;(global-semantic-tag-folding-mode 1)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; ECB ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)
(setq stack-trace-on-error t)
(add-to-list 'load-path
	     "~/.emacs.d/ecb")
(require 'ecb)
(require 'ecb-autoloads)
;(add-hook 'c-mode-common-hook
;	  (lambda()
;	    (ecb-minor-mode t)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
