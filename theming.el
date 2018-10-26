
;;; Default font
;;(if (eq window-system 'x)
;;  (set-default-font "monofur-13"))
;;(setq default-frame-alist '((font . "monofur-13")))

(set-default-font "-CTDB-Fira Code-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
;(set-face-attribute 'default nil
;					:font "Fira Code:style=Regular")
(setq default-frame-alist '((font . "Fira Code")))
(set-face-attribute 'bold nil :family "Fira Code"
					:height 110
					:weight 'bold)

(custom-set-variables
 '(custom-safe-themes (quote ("aaa019645671c074233a17f8b4c960627831754f340a4cc76ce1fa353ddf0728" default)))
 '(custom-theme-directory "~/.emacs.d/dotemacs"))
(use-package zenburn :ensure zenburn-theme)
;(load-theme 'shaggy t)
(load-theme 'zenburn t)
(setq prettify-symbols-unprettify-at-point 'right-edge)

(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'mixed) ; alternatives are 'parenthesis' and 'mixed'
(diminish 'abbrev-mode)
(diminish 'hs-minor-mode)


(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq initial-scratch-message ";;; Welcome back, master. Happy hacking.")

(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")

(defun pretty-fonts-set-fontsets (CODE-FONT-ALIST)
  "Utility to associate many unicode points with specified fonts."
  (--each CODE-FONT-ALIST
    (-let (((font . codes) it))
      (--each codes
        (set-fontset-font t `(,it . ,it) font)))))

;;;###autoload
(defun pretty-fonts--add-kwds (FONT-LOCK-ALIST)
  "Exploits `font-lock-add-keywords' to apply regex-unicode replacements."
  (font-lock-add-keywords
   nil (--map (-let (((rgx uni-point) it))
				`(,rgx (0 (progn
							(compose-region
							 (match-beginning 1) (match-end 1)
							 ,(concat "\t" (list uni-point)))
							nil))))
			  FONT-LOCK-ALIST)))

;;;###autoload
(defmacro pretty-fonts-set-kwds (FONT-LOCK-HOOKS-ALIST)
  "Set regex-unicode replacements to many modes."
  `(--each ,FONT-LOCK-HOOKS-ALIST
     (-let (((font-locks . mode-hooks) it))
       (--each mode-hooks
         (add-hook it (-partial 'pretty-fonts--add-kwds
                                (symbol-value font-locks)))))))

;;; Fira Font

(defconst pretty-fonts-fira-font
  '(;; OPERATORS
    ;; Pipes
    ("\\(<|\\)" #Xe14d) ("\\(<>\\)" #Xe15b) ("\\(<|>\\)" #Xe14e) ("\\(|>\\)" #Xe135)

    ;; Brackets
    ("\\(<\\*\\)" #Xe14b) ("\\(<\\*>\\)" #Xe14c) ("\\(\\*>\\)" #Xe104)
    ("\\(<\\$\\)" #Xe14f) ("\\(<\\$>\\)" #Xe150) ("\\(\\$>\\)" #Xe137)
    ("\\(<\\+\\)" #Xe155) ("\\(<\\+>\\)" #Xe156) ("\\(\\+>\\)" #Xe13a)

    ;; Equality
    ("\\(!=\\)" #Xe10e) ("\\(!==\\)"         #Xe10f) ("\\(=/=\\)" #Xe143)
    ("\\(/=\\)" #Xe12c) ("\\(/==\\)"         #Xe12d)
    ("\\(===\\)"#Xe13d) ("[^!/]\\(==\\)[^>]" #Xe13c)

    ;; Equality Special
    ("\\(||=\\)"  #Xe133) ("[^|]\\(|=\\)" #Xe134)
    ("\\(~=\\)"   #Xe166)
    ("\\(\\^=\\)" #Xe136)
    ("\\(=:=\\)"  #Xe13b)

    ;; Comparisons
    ("\\(<=\\)" #Xe141) ("\\(>=\\)" #Xe145)
    ("\\(</\\)" #Xe162) ("\\(</>\\)" #Xe163)

    ;; Shifts
    ("[^-=]\\(>>\\)" #Xe147) ("\\(>>>\\)" #Xe14a)
    ("[^-=]\\(<<\\)" #Xe15c) ("\\(<<<\\)" #Xe15f)

    ;; Dots
    ("\\(\\.-\\)"    #Xe122) ("\\(\\.=\\)" #Xe123)
    ("\\(\\.\\.<\\)" #Xe125)

    ;; Hashes
    ("\\(#{\\)"  #Xe119) ("\\(#(\\)"   #Xe11e) ("\\(#_\\)"   #Xe120)
    ("\\(#_(\\)" #Xe121) ("\\(#\\?\\)" #Xe11f) ("\\(#\\[\\)" #Xe11a)

    ;; REPEATED CHARACTERS
    ;; 2-Repeats
    ("\\(||\\)" #Xe132)
    ("\\(!!\\)" #Xe10d)
    ("\\(%%\\)" #Xe16a)
    ("\\(&&\\)" #Xe131)

    ;; 2+3-Repeats
    ("\\(##\\)"       #Xe11b) ("\\(###\\)"         #Xe11c) ("\\(####\\)" #Xe11d)
    ("\\(--\\)"       #Xe111) ("\\(---\\)"         #Xe112)
    ("\\({-\\)"       #Xe108) ("\\(-}\\)"          #Xe110)
    ("\\(\\\\\\\\\\)" #Xe106) ("\\(\\\\\\\\\\\\\\)" #Xe107)
    ("\\(\\.\\.\\)"   #Xe124) ("\\(\\.\\.\\.\\)"   #Xe126)
    ("\\(\\+\\+\\)"   #Xe138) ("\\(\\+\\+\\+\\)"   #Xe139)
    ("\\(//\\)"       #Xe12f) ("\\(///\\)"         #Xe130)
    ("\\(::\\)"       #Xe10a) ("\\(:::\\)"         #Xe10b)

    ;; ARROWS
    ;; Direct
    ("[^-]\\(->\\)" #Xe114) ("[^=]\\(=>\\)" #Xe13f)
    ("\\(<-\\)"     #Xe152)
    ("\\(-->\\)"    #Xe113) ("\\(->>\\)"    #Xe115)
    ("\\(==>\\)"    #Xe13e) ("\\(=>>\\)"    #Xe140)
    ("\\(<--\\)"    #Xe153) ("\\(<<-\\)"    #Xe15d)
    ("\\(<==\\)"    #Xe158) ("\\(<<=\\)"    #Xe15e)
    ("\\(<->\\)"    #Xe154) ("\\(<=>\\)"    #Xe159)

    ;; Branches
    ("\\(-<\\)"  #Xe116) ("\\(-<<\\)" #Xe117)
    ("\\(>-\\)"  #Xe144) ("\\(>>-\\)" #Xe148)
    ("\\(=<<\\)" #Xe142) ("\\(>>=\\)" #Xe149)
    ("\\(>=>\\)" #Xe146) ("\\(<=<\\)" #Xe15a)

    ;; Squiggly
    ("\\(<~\\)" #Xe160) ("\\(<~~\\)" #Xe161)
    ("\\(~>\\)" #Xe167) ("\\(~~>\\)" #Xe169)
    ("\\(-~\\)" #Xe118) ("\\(~-\\)"  #Xe165)

    ;; MISC
    ("\\(www\\)"                   #Xe100)
    ("\\(<!--\\)"                  #Xe151)
    ("\\(~@\\)"                    #Xe164)
    ("[^<]\\(~~\\)"                #Xe168)
    ("\\(\\?=\\)"                  #Xe127)
    ("[^=]\\(:=\\)"                #Xe10c)
    ("\\(/>\\)"                    #Xe12e)
    ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
    ("[^:=]\\(:\\)[^:=]"           #Xe16c)
    ("\\(<=\\)"                    #Xe157))
  "Fira font ligatures and their regexes")

(pretty-fonts-set-kwds
'((pretty-fonts-fira-font prog-mode-hook org-mode-hook)))

(require 'dash)
(set-fontset-font "fontset-default" '(#Xe100 . #Xe16f) "Fira Code Symbol")

;; (defun my-correct-symbol-bounds (pretty-alist)
;;   "Prepend a TAB character to each symbol in this alist,
;; this way compose-region called by prettify-symbols-mode
;; will use the correct width of the symbols
;; instead of the width measured by char-width."
;;   (mapcar (lambda (el)
;; 			(setcdr el (string ?\t (cdr el)))
;; 			el)
;; 		  pretty-alist))

;; (defun my-ligature-list (ligatures codepoint-start)
;;   "Create an alist of strings to replace with
;; codepoints starting from codepoint-start."
;;   (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
;; 	(-zip-pair ligatures codepoints)))
;; (setq my-fira-code-ligatures
;; 	  (let* ((ligs '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
;; 					 "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
;; 					 "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
;; 					 "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
;; 					 ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
;; 					 "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
;; 					 "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
;; 					 "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
;; 					 ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
;; 					 "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
;; 					 "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
;; 					 "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
;; 					 "x" ":" "+" "+" "*")))
;; 		(my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

;; (defun my-set-fira-ligatures ()
;;   "Add hasklig ligatures for use with prettify-symbols-mode."
;;   (setq prettify-symbols-alist
;; 		(append my-fira-code-ligatures prettify-symbols-alist))
;;   (prettify-symbols-mode))

;; (add-hook 'prog-mode-hook 'my-set-fira-ligatures)
