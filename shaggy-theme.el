(deftheme shaggy
  "Just trying things out, man")


(let* ((background "#2d2d2d")
	   (foreground "#cccccc")
	   (current-line "#393939")
	   (selection "#515151")
	   (comment "#999999")
	   (red "#f2777a")
	   (orange "#f99157")
	   (yellow "#ffcc66")
	   (green "#99cc99")
	   (aqua "#66cccc")
	   (blue "#6699cc")
	   (purple "#cc99cc")

	   (fg foreground)
       (bg background)

       (headline-1 `(:foreground ,fg :weight semi-bold :height 1.4 :overline ,bg :family "Iosevka"))
       (headline-2 `(:foreground ,fg :weight semi-bold :height 1.4 :overline ,bg :family "Iosevka"))
       (headline-3 `(:foreground ,fg :weight semi-bold :height 1.2 :overline ,bg :family "Iosevka Slab"))
	   (headline-4 `(:foreground ,fg :weight semi-bold :height 1.1 :overline ,bg)))

  (custom-theme-set-faces
   'shaggy

   ;; generic stuff
   `(button ((t (:foreground ,fg :underline t))))
   `(cursor ((t (:background ,fg :foreground "white smoke"))))
   `(custom-variable-tag ((t (:foreground ,fg :weight bold))))
   `(default ((t (:background ,bg :foreground ,fg))))
   `(default-italic ((t (:italic t))))
   `(font-lock-builtin-face ((t (:foreground ,purple))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comment :slant oblique :weight light :family "Iosevka"))))
   `(font-lock-comment-face ((t (:foreground ,comment :slant oblique :weight light :family "Iosevka"))))
   `(font-lock-constant-face ((t (:foreground ,blue))))
   `(font-lock-doc-face ((t (:foreground ,purple :weight light :family "Iosevka"))))
   `(font-lock-doc-string-face ((t (:foreground ,yellow :weight light :family "Iosevka"))))
   `(font-lock-function-name-face ((t (:foreground ,orange :underline t))))
   `(font-lock-keyword-face ((t (:foreground ,green :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,purple))))
   `(font-lock-reference-face ((t (:foreground ,fg))))
   `(font-lock-string-face ((t (:foreground ,aqua :family "Iosevka Slab"))))
   `(font-lock-type-face ((t (:foreground ,blue :underline t))))
   `(font-lock-variable-name-face ((t (:foreground ,yellow :underline nil))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))
   `(fringe ((t (:background ,bg :foreground ,fg))))
   `(gnus-header-content ((t (:foreground ,fg))))
   `(gnus-header-from ((t (:foreground ,fg))))
   `(gnus-header-name ((t (:foreground ,fg))))
   `(gnus-header-subject ((t (:foreground ,fg))))
   `(italic ((t (:slant italic))))
   `(shadow ((t (:foreground ,comment))))
   `(success ((t (:foreground ,green))))
   `(tooltip ((t (:foreground ,yellow :background ,background :inverse-video t))))
   `(underline ((t (:underline t))))
   `(warning ((t (:foreground ,orange))))
   `(highlight ((t nil)))

   `(ido-subdir ((t (:foreground ,purple))))
   `(ido-first-match ((t (:foreground ,orange :weight bold))))
   `(ido-vertical-first-match ((t (:foreground ,orange :weight bold))))
   `(ido-only-match ((t (:foreground ,green))))
   `(ido-indicator ((t (:foreground ,red :background ,background))))
   `(ido-virtual ((t (:foreground ,comment))))

   `(match ((t (:foreground ,blue :background ,background :inverse-video t))))
   `(isearch ((t (:foreground ,yellow :background ,background :inverse-video t))))
   `(lazy-highlight ((t (:foreground ,aqua :background ,background :inverse-video t))))
   `(isearch-fail ((t (:background ,background :inherit font-lock-warning-face :inverse-video t))))

   `(link ((t (:foreground ,fg :underline t))))

   `(mode-line ((t (:foreground ,foreground :background ,selection :weight normal :box (:line-width 1 :color ,selection) :height 1.0))))
   `(mode-line-buffer-id ((t (:foreground ,purple :background nil))))
   `(mode-line-inactive ((t (:inherit mode-line :foreground ,comment :background ,current-line :weight normal :height 1.0))))
   `(mode-line-emphasis ((t (:foreground ,foreground :slant italic))))
   `(mode-line-highlight ((t (:foreground ,purple :box nil :weight bold))))
   `(minibuffer-prompt ((t (:foreground ,blue :weight bold))))

   ;; latex
   `(font-latex-bold-face ((t (:foreground ,green :weight bold))))
   `(font-latex-doctex-documentation-face ((t (:inherit highlight))))
   `(font-latex-italic-face ((t (:foreground ,green :slant italic))))
   `(font-latex-math-face ((t (:foreground ,purple))))
   `(font-latex-script-char-face ((t (:foreground ,red))))
   `(font-latex-sectioning-0-face ((t (:foreground ,yellow :weight bold :height 1.1))))
   `(font-latex-sectioning-1-face ((t (:foreground ,yellow :weight bold :height 1.1))))
   `(font-latex-sectioning-2-face ((t (:foreground ,yellow :weight bold :height 1.1))))
   `(font-latex-sectioning-3-face ((t (:foreground ,yellow :weight bold :height 1.1))))
   `(font-latex-sectioning-4-face ((t (:foreground ,yellow :weight bold :height 1.1))))
   `(font-latex-sectioning-5-face ((t (:foreground ,yellow :weight bold))))
   `(font-latex-sedate-face ((t (:foreground ,orange))))
   `(font-latex-slide-title-face ((t (:foreground ,blue :weight bold :height 1.2))))
   `(font-latex-string-face ((t (:inherit font-lock-string-face))))
   `(font-latex-verbatim-face ((t (:inherit font-lock-string-face))))
   `(font-latex-warning-face ((t (:inherit warning))))

   ;; TeX-fold
   `(TeX-fold-folded-face ((t (:foreground ,purple))))
   `(TeX-fold-unfolded-face ((t (:inherit highlight))))

   ;; org
   `(org-agenda-structure ((t (:foreground ,purple))))
   `(org-agenda-current-time ((t (:foreground ,yellow))))
   `(org-agenda-date ((t (:foreground ,blue :underline nil :height 1.2))))
   `(org-agenda-done ((t (:foreground ,green))))
   `(org-agenda-dimmed-todo-face ((t (:foreground ,comment))))
   `(org-block ((t (:foreground ,orange))))
   `(org-block-begin-line ((t (:foreground ,orange :family "Iosevka Slab"))))
   `(org-block-end-line ((t (:foreground ,orange :family "Iosevka Slab"))))
   `(org-code ((t (:foreground ,yellow :family "Iosevka Slab"))))
   `(org-column ((t (:background ,selection))))
   `(org-column-title ((t (:inherit org-column :weight bold :underline t))))
   `(org-date ((t (:foreground ,blue :underline t))))
   `(org-document-info ((t (:foreground ,aqua))))
   `(org-document-info-keyword ((t (:foreground ,green))))
   `(org-document-title ((t (:weight bold :foreground ,orange :height 1.44))))
   `(org-done ((t (:foreground ,green  :family "Iosevka Slab"))))
   `(org-ellipsis ((t (:foreground ,comment))))
   `(org-footnote ((t (:foreground ,aqua))))
   `(org-formula ((t (:foreground ,red))))
   `(org-hide ((t (:foreground ,background :background ,background))))
   `(org-link ((t (:foreground ,blue :underline t))))
   `(org-scheduled ((t (:foreground ,green))))
   `(org-scheduled-previously ((t (:foreground ,aqua))))
   `(org-scheduled-today ((t (:foreground ,green))))
   `(org-special-keyword ((t (:foreground ,orange))))
   `(org-table ((t (:foreground ,purple))))
   `(org-time-grid ((t (:foreground ,yellow))))
   `(org-todo ((t (:foreground ,red :family "Iosevka Slab"))))
   `(org-upcoming-deadline ((t (:foreground ,orange))))
   `(org-warning ((t (:weight bold :foreground ,red))))

   `(region ((t (:background "#eeeee8" :foreground ,fg))))
   `(slime-repl-inputed-output-face ((t (:foreground ,fg))))
   `(whitespace-line ((t (:background ,selection :foreground ,orange))))

   ;; magit
   `(magit-header ((t (:weight bold))))
   `(magit-item-mark ((t (:background ,selection))))
   `(magit-item-highlight ((t (:weight bold))))
   `(magit-section-heading ((t (:weight bold :height 1.2))))
   `(magit-section-highlight ((t (:inherit default))))
   `(magit-diff-context-highlight ((t (:weight bold))))
   `(magit-branch-local ((t (:weight bold))))
   `(magit-branch-remote ((t (:weight bold))))

   `(magit-bisect-bad ((t (:foreground ,red))))
   `(magit-bisect-good ((t (:foreground ,green))))
   `(magit-bisect-skip ((t (:foreground ,orange))))
   `(magit-blame-date ((t (:foreground ,red))))
   `(magit-blame-heading ((t (:foreground ,orange :background ,current-line))))
   `(magit-branch-current ((t (:foreground ,blue))))
   `(magit-branch-local ((t (:foreground ,aqua))))
   `(magit-branch-remote ((t (:foreground ,green))))
   `(magit-cherry-equivalent ((t (:foreground ,purple))))
   `(magit-cherry-unmatched ((t (:foreground ,aqua))))
   `(magit-diff-added ((t (:foreground ,green))))
   `(magit-diff-added-highlight ((t (:foreground ,green :background ,current-line))))
   `(magit-diff-base ((t (:foreground ,background :background ,orange))))
   `(magit-diff-base-highlight ((t (:foreground ,orange :background ,current-line))))
   `(magit-diff-context ((t (:foreground ,comment))))
   `(magit-diff-context-highlight ((t (:foreground ,comment :background ,current-line))))
   `(magit-diff-file-heading ((t (:foreground ,foreground))))
   `(magit-diff-file-heading-highlight ((t (:background ,selection :weight bold))))
   `(magit-diff-file-heading-selection ((t (:foreground ,orange :background ,current-line))))
   `(magit-diff-hunk-heading ((t (:foreground ,foreground :background ,selection))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,selection))))
   `(magit-diff-lines-heading ((t (:foreground ,yellow :background ,red))))
   `(magit-diff-removed ((t (:foreground ,orange))))
   `(magit-diff-removed-highlight ((t (:foreground ,orange :background ,current-line))))
   `(magit-diffstat-added ((t (:foreground ,green))))
   `(magit-diffstat-removed ((t (:foreground ,orange))))
   `(magit-dimmed ((t (:foreground ,comment))))
   `(magit-hash ((t (:foreground ,comment))))
   `(magit-header-line ((t (:inherit nil :weight bold))))
   `(magit-log-author ((t (:foreground ,orange))))
   `(magit-log-date ((t (:foreground ,blue))))
   `(magit-log-graph ((t (:foreground ,comment))))
   `(magit-process-ng ((t (:inherit error))))
   `(magit-process-ok ((t (:inherit success))))
   `(magit-reflog-amend ((t (:foreground ,purple))))
   `(magit-reflog-checkout ((t (:foreground ,blue))))
   `(magit-reflog-cherry-pick ((t (:foreground ,green))))
   `(magit-reflog-commit ((t (:foreground ,green))))
   `(magit-reflog-merge ((t (:foreground ,green))))
   `(magit-reflog-other ((t (:foreground ,aqua))))
   `(magit-reflog-rebase ((t (:foreground ,purple))))
   `(magit-reflog-remote ((t (:foreground ,aqua))))
   `(magit-reflog-reset ((t (:inherit error))))
   `(magit-refname ((t (:foreground ,comment))))
   `(magit-section-heading ((t (:foreground ,yellow :weight bold :height 1.2))))
   `(magit-section-heading-selection ((t (:foreground ,orange :weight bold))))
   `(magit-section-highlight ((t (:background ,current-line :weight bold))))
   `(magit-sequence-drop ((t (:foreground ,red))))
   `(magit-sequence-head ((t (:foreground ,blue))))
   `(magit-sequence-part ((t (:foreground ,orange))))
   `(magit-sequence-stop ((t (:foreground ,green))))
   `(magit-signature-bad ((t (:inherit error))))
   `(magit-signature-error ((t (:inherit error))))
   `(magit-signature-expired ((t (:foreground ,orange))))
   `(magit-signature-good ((t (:inherit success))))
   `(magit-signature-revoked ((t (:foreground ,purple))))
   `(magit-signature-untrusted ((t (:foreground ,aqua))))
   `(magit-tag ((t (:foreground ,yellow))))

   ;; git-gutter
   `(git-gutter:modified ((t (:foreground ,purple :weight bold))))
   `(git-gutter:added ((t (:foreground ,green :weight bold))))
   `(git-gutter:deleted ((t (:foreground ,red :weight bold))))
   `(git-gutter:unchanged ((t (:background ,yellow))))

   ;; git-gutter-fringe
   `(git-gutter-fr:modified ((t (:foreground ,purple :weight bold))))
   `(git-gutter-fr:added ((t (:foreground ,green :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,red :weight bold))))

   ;; markdown
   `(markdown-header-face-1 ((t ,headline-2)))
   `(markdown-header-face-2 ((t ,headline-3)))
   `(markdown-header-face-3 ((t ,headline-4)))
   `(markdown-header-face-4 ((t ,headline-4)))
   `(markdown-header-face-5 ((t ,headline-4)))
   `(markdown-header-face-6 ((t ,headline-4)))

   `(markdown-url-face ((t (:inherit link))))
   `(markdown-link-face ((t (:foreground ,blue :underline t))))
   `(markdown-code-face ((t (:inherit fixed-pitch :background ,background :foreground ,purple))))
   `(markdown-inline-code-face ((t (:inherit markdown-code-face :family "Iosevka Slab"))))

   ;; compile
   `(compilation-column-number ((t (:foreground ,yellow))))
   `(compilation-line-number ((t (:foreground ,yellow))))
   `(compilation-message-face ((t (:foreground ,blue))))
   `(compilation-mode-line-exit ((t (:foreground ,green))))
   `(compilation-mode-line-fail ((t (:foreground ,red))))
   `(compilation-mode-line-run (:foreground ((t ,blue))))

   ;; Grep
   `(grep-context-face ((t (:foreground ,comment))))
   `(grep-error-face ((t (:foreground ,red :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,blue))))
   `(grep-match-face ((t (:foreground nil :background nil :inherit match))))

   ;; wgrep
   `(wgrep-delete-face ((t (:foreground ,red))))
   `(wgrep-done-face ((t (:foreground ,blue))))
   `(wgrep-face ((t (:foreground ,green :background ,selection))))
   `(wgrep-file-face ((t (:foreground ,comment :background ,selection))))
   `(wgrep-reject-face ((t (:foreground ,orange :weight bold))))

   ;; regex-tool
   `(regex-tool-matched-face ((t (:foreground nil :background nil :inherit match))))

   ;; re-builder
   `(reb-match-0 ((t (:foreground ,background :background ,aqua))))
   `(reb-match-1 ((t (:foreground ,background :background ,yellow))))
   `(reb-match-2 ((t (:foreground ,background :background ,orange))))
   `(reb-match-3 ((t (:foreground ,background :background ,blue))))

   ;; mark-multiple
   `(mm/master-face ((t (:inherit region :foreground nil :background nil))))
   `(mm/mirror-face ((t (:inherit region :foreground nil :background nil))))

   ;; Flycheck
   `(flycheck-error ((t (:underline (:style wave :color ,red)))))
   `(flycheck-info ((t (:underline (:style wave :color ,aqua)))))
   `(flycheck-warning ((t (:underline (:style wave :color ,orange)))))
   `(flycheck-fringe-error ((t (:foreground ,red))))
   `(flycheck-fringe-info ((t (:foreground ,aqua))))
   `(flycheck-fringe-warning ((t (:foreground ,orange))))
   `(flycheck-color-mode-line-error-face ((t (:foreground ,red))))
   `(flycheck-color-mode-line-warning-face ((t (:foreground ,orange))))
   `(flycheck-color-mode-line-info-face ((t (:foreground ,aqua))))
   `(flycheck-color-mode-line-running-face ((t (:foreground ,comment))))
   `(flycheck-color-mode-line-success-face ((t (:foreground ,green))))

   ;; Flymake
   `(flymake-error ((t (:underline (:style wave :color ,red)))))
   `(flymake-note ((t (:underline (:style wave :color ,aqua)))))
   `(flymake-warning ((t (:underline (:style wave :color ,orange)))))

   ;; Flyspell
   `(flyspell-incorrect ((t (:underline (:style wave :color ,red)))))

   ;; Lispy
   `(lispy-command-name-face ((t (:inherit font-lock-function-name-face :background ,current-line))))
   `(lispy-cursor-face ((t (:foreground ,background :background ,foreground))))
   `(lispy-face-hint ((t (:foreground ,green :background ,selection))))

   ;; Clojure errors
   `(clojure-test-failure-face ((t (:background nil :inherit flymake-warnline))))
   `(clojure-test-error-face ((t (:background nil :inherit flymake-errline))))
   `(clojure-test-success-face ((t (:background nil :foreground nil :underline ,green))))

   ;; Ivy
   `(ivy-action ((t (:foreground ,purple))))
   `(ivy-confirm-face ((t (:foreground ,green))))
   `(ivy-current-match ((t (:foreground ,green :inherit highlight :underline t))))
   `(ivy-cursor ((t (:background ,selection))))
   `(ivy-match-required-face ((t (:inherit ido-indicator))))
   `(ivy-remote ((t (:foreground ,orange))))
   `(ivy-subdir ((t (:inherit ido-subdir))))
   `(ivy-virtual ((t (:inherit ido-virtual))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,aqua))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,yellow))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground ,blue))))
   `(ivy-minibuffer-match-face-4 ((t (:foreground ,orange))))

   ;; dired
   `(dired-directory ((t (:weight bold))))

   ;; helm

   `(helm-ff-symlink ((t (:foreground ,fg :slant italic))))
   `(helm-buffer-saved-out ((t (:inherit warning))))
   `(helm-buffer-size ((t (:foreground ,yellow))))
   `(helm-buffer-not-saved ((t (:foreground ,orange))))
   `(helm-buffer-process ((t (:foreground ,aqua))))
   `(helm-buffer-directory ((t (:foreground ,blue))))
   `(helm-ff-dotted-directory ((t (:foreground ,comment :weight bold))))
   `(helm-ff-dotted-symlink-directory ((t (:foreground ,comment))))
   `(helm-ff-directory ((t (:foreground ,aqua :weight bold))))
   `(helm-candidate-number ((t (:foreground ,red))))
   `(helm-match ((t (:inherit match))))
   `(helm-selection ((t (:inherit highlight))))
   `(helm-separator ((t (:foreground ,purple))))
   `(helm-source-header ((t (:weight bold :foreground ,orange :height 1.44 :weight bold))))

   ;; iedit
   `(iedit-occurrence ((t (:background ,selection :foreground ,fg))))

   ;; company
   `(company-preview ((t (:foreground ,comment :background ,selection))))
   `(company-preview-common ((t (:inherit company-preview :foreground ,red))))
   `(company-preview-search ((t (:inherit company-preview :foreground ,blue))))
   `(company-tooltip ((t (:background ,selection))))
   `(company-tooltip-selection ((t (:foreground ,comment :inverse-video t))))
   `(company-tooltip-common ((t (:inherit company-tooltip :foreground ,red))))
   `(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :foreground ,red))))
   `(company-tooltip-search ((t (:inherit company-tooltip :foreground ,blue))))
   `(company-tooltip-annotation ((t (:inherit company-tooltip :foreground ,green))))
   `(company-tooltip-annotation-selection ((t (:inherit company-tooltip-selection :foreground ,green))))
   `(company-scrollbar-bg ((t (:inherit 'company-tooltip :background ,current-line))))
   `(company-scrollbar-fg ((t (:background ,selection))))
   `(company-echo-common ((t (:inherit company-echo :foreground ,red))))

   ;; parens - parenface
   `(paren-face ((t (:foreground ,comment :background nil))))
   '(parenface-paren-face ((t (:foreground ,comment))))
   '(parenface-curly-face ((t (:foreground ,comment))))
   '(parenface-bracket-face ((t (:foreground ,comment))))

   ;; Parenthesis matching (built-in)
   `(show-paren-match ((t (:background ,purple :foreground ,background))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,background))))

   ;; parens - paren-face
   '(parenthesis ((t (:foreground ,comment))))

   ;; Smartparens paren matching
   `(sp-show-pair-match-face ((t (:foreground nil :background nil :inherit show-paren-match))))
   `(sp-show-pair-mismatch-face ((t (:foreground nil :background nil :inherit show-paren-mismatch))))

   ;; Diff
   `(diff-added ((t (:foreground ,green))))
   `(diff-changed ((t (:foreground ,blue))))
   `(diff-removed ((t (:foreground ,orange))))
   `(diff-header ((t (:foreground ,aqua :background nil))))
   `(diff-file-header ((t (:foreground ,blue :background nil))))
   `(diff-hunk-header ((t (:foreground ,purple))))
   `(diff-refine-added ((t (:foreground ,aqua))))
   `(diff-refine-removed ((t (:foreground ,red))))

   `(diff-hl-insert ((t (:background ,green))))
   `(diff-hl-change ((t (:background ,blue))))
   `(diff-hl-delete ((t (:background ,orange))))
   `(diff-hl-unknown ((t (:background ,purple))))

   ;; ediff
   `(ediff-current-diff-A ((t (:foreground ,comment :background ,current-line))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,aqua :background ,current-line))))
   `(ediff-current-diff-B ((t (:foreground ,comment :background ,current-line))))
   `(ediff-current-diff-C ((t (:foreground ,comment :background ,current-line))))
   `(ediff-even-diff-A ((t (:foreground ,blue :background ,selection))))
   `(ediff-even-diff-Ancestor ((t (:foreground ,purple :background ,current-line))))
   `(ediff-even-diff-B ((t (:foreground ,blue :background ,selection))))
   `(ediff-even-diff-C ((t (:foreground ,blue :background ,selection))))
   `(ediff-fine-diff-A ((t (:foreground ,green :background ,selection))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,yellow :background ,current-line))))
   `(ediff-fine-diff-B ((t (:foreground ,green :background ,selection))))
   `(ediff-fine-diff-C ((t (:foreground ,green :background ,selection))))
   `(ediff-odd-diff-A ((t (:foreground ,orange :background ,selection))))
   `(ediff-odd-diff-Ancestor ((t (:foreground ,red :background ,current-line))))
   `(ediff-odd-diff-B ((t (:foreground ,orange :background ,selection))))
   `(ediff-odd-diff-C ((t (:foreground ,orange :background ,selection))))

   ;; ElDoc
   `(eldoc-highlight-function-argument ((t (:foreground ,green :weight bold))))

   ;; macrostep
   `(macrostep-expansion-highlight-face ((t (:inherit highlight :foreground nil))))

   ;; Hydra
   `(hydra-face-blue ((t (:foreground ,blue))))
   `(hydra-face-teal ((t (:foreground ,aqua))))
   `(hydra-face-pink ((t (:foreground ,purple))))
   `(hydra-face-red ((t (:foreground ,red))))
   ;; this is unfortunate, but we have no color close to amaranth in
   ;; our palette
   `(hydra-face-amaranth ((t (:foreground ,orange))))

   ;; js2-mode
   `(js2-warning ((t (:underline ,orange))))
   `(js2-error ((t (:foreground nil :underline ,red))))
   `(js2-external-variable ((t (:foreground ,purple))))
   `(js2-function-param ((t (:foreground ,blue))))
   `(js2-instance-member ((t (:foreground ,blue))))
   `(js2-private-function-call ((t (:foreground ,red))))
   ;; js2-mode additional attributes for better syntax highlight in javascript
   `(js2-jsdoc-tag ((t (:foreground ,aqua))))
   `(js2-jsdoc-type ((t (:foreground ,orange))))
   `(js2-jsdoc-value ((t (:foreground ,orange))))
   `(js2-function-call ((t (:foreground ,green))))
   `(js2-object-property ((t (:foreground ,orange))))
   `(js2-private-member ((t (:foreground ,purple))))
   `(js2-jsdoc-html-tag-name ((t (:foreground ,orange))))
   `(js2-jsdoc-html-tag-delimiter ((t (:foreground ,orange))))

   ;; Powerline
   `(powerline-active1 ((t (:foreground ,foreground :background ,current-line))))
   `(powerline-active2 ((t (:foreground ,foreground :background ,selection))))

   ;; Powerline-evil
   `(powerline-evil-base-face ((t (:inherit mode-line :foreground ,background))))
   `(powerline-evil-emacs-face ((t (:inherit powerline-evil-base-face :background ,purple))))
   `(powerline-evil-insert-face ((t (:inherit powerline-evil-base-face :background ,blue))))
   `(powerline-evil-motion-face ((t (:inherit powerline-evil-base-face :background ,orange))))
   `(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background ,green))))
   `(powerline-evil-operator-face ((t (:inherit powerline-evil-base-face :background ,aqua))))
   `(powerline-evil-replace-face ((t (:inherit powerline-evil-base-face :background ,red))))
   `(powerline-evil-visual-face ((t (:inherit powerline-evil-base-face :background ,yellow))))

   ;; perl
   `(cperl-hash-face ((t (:foreground ,fg))))
   `(cperl-array-face ((t (:foreground ,fg))))
   `(cperl-nonoverridable-face ((t (:foreground ,fg))))

   ;; rpm-spec-mode
   `(rpm-spec-tag-face ((t (:inherit default))))
   `(rpm-spec-package-face ((t (:inherit default))))
   `(rpm-spec-macro-face ((t (:inherit default))))
   `(rpm-spec-doc-face ((t (:inherit default))))
   `(rpm-spec-var-face ((t (:inherit default))))
   `(rpm-spec-ghost-face ((t (:inherit default))))
   `(rpm-spec-section-face ((t (:inherit default :weight bold))))

   ;; misc
   `(idle-highlight ((t (:background ,selection))))
   `(yas-field-highlight-face ((t (:background "#eeeee8" :foreground ,fg))))
   `(eshell-prompt ((t (:foreground ,fg :weight bold))))
   `(cider-result-overlay-face ((t (:weight bold))))))

;;;###autoload
(when load-file-name
  (add-to-list
   'custom-theme-load-path
   (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'shaggy)
;;; shaggy-theme.el ends here
