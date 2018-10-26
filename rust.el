(use-package racer
  :ensure rust-mode
  :ensure company
  :ensure t
  :config
  (require 'rust-mode)
  (require 'flycheck-rust)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  :bind (("C-c d" . racer-describe)))
