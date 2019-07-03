(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; From https://blog.fugue.co/2015-11-11-guide-to-emacs.html
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'org)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-directory "~/orgmode")
 '(package-selected-packages (quote (ace-jump-mode helm helm-ebdb org-edna))))

(global-set-key "\C-ca" 'org-agenda)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(require 'ace-jump-mode)
(define-key global-map (kbd "M-SPC" ) 'ace-jump-mode)


(define-key global-map (kbd "<next>") 'org-move-subtree-down)
(define-key global-map (kbd "<prior>") 'org-move-subtree-up)

;;;;;;;;;;;;;;
;; Org mode ;;
;;;;;;;;;;;;;;

(setq org-agenda-files (quote ("~/orgmode/inbox.org"
                               "~/orgmode/next_actions.org")))
;; Refile
(setq org-refile-targets '((nil :maxlevel . 1)
                           (org-agenda-files :maxlevel . 1)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d)" "CANCELED(c)" "DEFER(f)")))



;; Track done time
(setq org-log-done 'time)

;; Capture
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(define-key global-map "\C-cc" 'org-capture)

;; Custom tool for archiving
(defun tb-org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" nil))

;; Custom styles
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red3" :weight "normal"))
	("STARTED" . (:foreground "black" :background "yellow"))
	("NEXT" . (:foreground "white" :background "red"))))

(setq org-priority-faces '((?A . (:foreground "red" :weight 'bold))
                           (?B . (:foreground "orange"))
                           (?C . (:foreground "green"))))

(setq browse-url-browser-function 'browse-url-xdg-open)
