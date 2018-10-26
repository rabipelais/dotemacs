(use-package spaceline
  :ensure t
  :ensure ein
  :ensure all-the-icons
  :ensure spaceline-all-the-icons
  :ensure nyan-mode
  :ensure anzu
  :ensure evil
  :config
  (setq nyan-wavy-trail t)
  (nyan-mode t)
  (setq powerline-default-separator 'butt)
  (setq anzu-cons-mode-line-p nil)
  (setq evil-default-state 'emacs)
  (evil-mode 1)
  (setq evil-default-state 'emacs)
  (require 'spaceline-config)
  (require 'spaceline-segments)
  (defun my/spaceline--theme (left second-left &rest additional-segments)
	"Convenience function for the spacemacs and emacs themes."
	(spaceline-compile
	  `(,left
		(anzu :priority 4)
		auto-compile
		,second-left
		major-mode
		(process :when active)
		((flycheck-error flycheck-warning flycheck-info)
		 :when active
		 :priority -9)
		(minor-modes :when active)
		(mu4e-alert-segment :when active)
		(erc-track :when active)
		(version-control :when active
						 :priority 7)
		(org-pomodoro :when active)
		(org-clock :when active)
		nyan-cat)
	  `(which-function
		(python-pyvenv :fallback python-pyenv)
		purpose
		(battery :when active)
		(selection-info :priority 2)
		input-method
		((point-position
		  line-column)
		 :priority -10)
		(global :when active)
		,@additional-segments
		(hud :priority -10)))

	(setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

  (defun my/spaceline-spacemacs-theme (&rest additional-segments)
	"Install the modeline used by Spacemacs.
ADDITIONAL-SEGMENTS are inserted on the right, between `global' and
`buffer-position'."
	(apply 'my/spaceline--theme
		   '((persp-name
			  workspace-number
			  window-number)
			 :fallback evil-state
			 :face highlight-face
			 :priority -10)
		   '((buffer-modified buffer-id remote-host)
			 :priority -10)
		   additional-segments))
  (my/spaceline-spacemacs-theme)
  (which-function-mode))
