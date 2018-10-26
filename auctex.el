
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Auctex ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'auctex)
(use-package auctex
  :disabled t
  :ensure t)

(unless (locate-library "auctex")
  (package-install 'auctex))
(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)
;; (add-to-list 'load-path "~/.emacs.d/lisp/predictive")
;; (use-package predictive
;;   :ensure t)
;; (autoload 'predictive-mode "predictive" "predictive" t)
;; (set-default 'predictive-auto-add-to-dict t)
;; (setq predictive-main-dict 'rpg-dictionary
;;       predictive-auto-learn t
;;       predictive-add-to-dict-ask nil
;;       predictive-use-auto-learn-cache nil
;;       predictive-which-dict t)

(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (add-hook 'LaTeX-mode-hook 'visual-line-mode)
    (add-hook 'LaTeX-mode-hook 'flyspell-mode)
    (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    (setq reftex-plug-into-AUCTeX t)

(defun guess-TeX-master (filename)
      "Guess the master file for FILENAME from currently open .tex files."
      (let ((candidate nil)
            (filename (file-name-nondirectory filename)))
        (save-excursion
          (dolist (buffer (buffer-list))
            (with-current-buffer buffer
              (let ((name (buffer-name))
                    (file buffer-file-name))
                (if (and file (string-match "\\.tex$" file))
                    (progn
                      (goto-char (point-min))
                      (if (re-search-forward (concat "\\\\input{" filename "}") nil t)
                          (setq candidate file))
                      (if (re-search-forward (concat "\\\\include{" (file-name-sans-extension filename) "}") nil t)
                          (setq candidate file))))))))
        (if candidate
            (message "TeX master document: %s" (file-name-nondirectory candidate)))
        candidate))

 	

(setq-default TeX-master nil)

				       ;(add-hook 'Latex-mode-hook
;	  (lambda()
;	    (setq TeX-master (guess-TeX-master (buffer-file-name)))))
