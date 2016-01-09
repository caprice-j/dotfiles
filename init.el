

;; load package-manager: el-get
(when load-file-name
 (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;  packages
(el-get-bundle auto-complete)

(el-get-bundle syohex/emacs-git-gutter)
(global-git-gutter-mode +1)
(custom-set-variables
 '(git-gutter:window-width 3)
 '(git-gutter:modified-sign "  ") ;; two space
 '(git-gutter:added-sign "++")    ;; multiple character is OK
 '(git-gutter:deleted-sign "--"))
(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

(el-get-bundle emacs-helm/helm)
(helm-mode 1)
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "M-x") 'helm-M-x)

(el-get-bundle syohex/emacs-helm-ag)

(el-get-bundle emacsmirror/col-highlight) ; you need to install vline.el too
(column-highlight-mode)
(custom-set-faces '(col-highlight((t (:background "black")))))

(el-get-bundle magnars/multiple-cursors.el)

;(el-get-bundle antonj/Highlight-Indentation-for-Emacs)
;(highlight-indentation-mode 1)
;(set-face-background 'highlight-indentation-face "#e3e3d3")
(el-get-bundle zk-phi/indent-guide)
(indent-guide-global-mode)
(setq indent-guide-recursive t)
;(setq indent-guide-char ":")


; just for fun
(el-get-bundle syohex/emacs-jazzradio)


; If Mac OS, use command key as meta key
;(when (eq system-type 'darwin)
;  (setq ns-command-modifier (quote meta));)

; C-z を undo に、 susoend を C-t に変更
(define-key global-map (kbd "C-z") 'undo)
; (define-key global-map (kbd "C-t") 'suspend-emacs)
(define-key global-map (kbd "C-h") 'delete-backward-char)


; M-x, M-p で 5行移動できるように設定
(define-key global-map (kbd "M-n") (kbd "C-u 10 C-n"))
(define-key global-map (kbd "M-p") (kbd "C-u 10 C-p"))
;(define-key global-map (kbd "M-f") (kbd "C-u 3 C-f"))
;(define-key global-map (kbd "M-b") (kbd "C-u 3 C-b"))


 (global-hl-line-mode t)
 (custom-set-faces '(hl-line ((t (:background "black"))))) 
;(setq hl-line-face 'underline) ; 下線

; get xterm-related mouse events
(xterm-mouse-mode t)
;(mouse-wheel-mode t)

(set-default-coding-systems 'utf-8)


;(set-scroll-bar-mode 'right)

(setq backup-inhibited t)

(setq transient-mark-mode t)

(setq tab-width 4)
(setq-default indent-tabs-mode nil)

; error checker
(add-hook 'c-mode-common-hook 'flycheck-mode)

(defalias 'exit 'save-buffers-kill-emacs)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.r\\'" . r-mode))
