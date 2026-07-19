(setq gc-cons-threshold most-positive-fixnum
        gc-cons-percentage 0.6)
  (setq package-enable-at-startup nil)
  (setq native-comp-async-report-warnings-errors 'silent)
  (push '(menu-bar-lines . 0) default-frame-alist)
  (push '(tool-bar-lines . 0) default-frame-alist)
  (push '(vertical-scroll-bars) default-frame-alist)
