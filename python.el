
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Python ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package elpy
  :ensure t
  :ensure flycheck
  :ensure py-autopep8
  :ensure ein
  :ensure jedi
  :diminish elpy-mode
  :diminish highlight-indentation-mode
  :config
  (elpy-enable)
  (elpy-use-ipython)
  (setq elpy-syntax-check-command "pylint")
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  (setq elpy-rpc-backend "jedi"))
