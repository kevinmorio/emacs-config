;;;
;;; Packages
;;;

;; Allow multiple Emacs versions to share the same repositories
;; using a build directory based on the current Emacs version.
(setq straight-build-dir (concat "build/" emacs-version))

;; Setup straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package and required packages using straight
(straight-use-package 'use-package)
(straight-use-package 'diminish)
(straight-use-package 'bind-key)
(straight-use-package 'org)

;; Use straight.el by default for use-package
(setq straight-use-package-by-default t)

;; Load all Org files in the user's emacs directory.
;; (mapc #'org-babel-load-file (directory-files user-emacs-directory t "\\.org$"))

(org-babel-load-file (expand-file-name "main.org" user-emacs-directory) nil)

;;; init.el ends he
