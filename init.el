



(set-foreground-color                                  "#CCCCCC") ; 文字色
;(set-background-color                                  "#333333") ; 背景色
(set-cursor-color                                      "#FF0000") ; カーソル色
(set-face-background 'region                           "#222244") ; リージョン
(set-face-foreground 'mode-line                         "#CCCCCC") ; モードライン文字
(set-face-background 'mode-line                         "#333333") ; モードライン背景
(set-face-foreground 'mode-line-inactive               "#333333") ; モードライン文字(非アクティブ)
(set-face-background 'mode-line-inactive               "#CCCCCC") ; モードライン背景(非アクティブ)
(set-face-foreground 'font-lock-comment-delimiter-face "#888888") ; コメントデリミタ
(set-face-foreground 'font-lock-comment-face           "#888888") ; コメント
(set-face-foreground 'font-lock-string-face            "#7FFF7F") ; 文字列
(set-face-foreground 'font-lock-function-name-face     "#BF7FFF") ; 関数名
(set-face-foreground 'font-lock-keyword-face           "#FF7F7F") ; キーワード
(set-face-foreground 'font-lock-constant-face          "#FFBF7F") ; 定数(this, selfなども)
(set-face-foreground 'font-lock-variable-name-face     "#7F7FFF") ; 変数
(set-face-foreground 'font-lock-type-face              "#FFFF7F") ; クラス
(set-face-foreground 'fringe                           "#666666") ; fringe(折り返し記号なでが出る部分)
(set-face-background 'fringe                           "#282828") ; fringe

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
(el-get-bundle magnars/multiple-cursors.el)


(load-library "hideshow")
(el-get-bundle emacswiki:hideshowvis)
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(add-hook 'c++-mode-hook 'hs-minor-mode)

(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook
            'python-mode-hook))
  (add-hook hook 'hideshowvis-enable))

(el-get-bundle hideshow-fringe)
(el-get-bundle hideshow-org)


(el-get-bundle ess)
(setq auto-mode-alist
     (cons (cons "\\.r$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)

(el-get-bundle auto-complete)

;(el-get-bundle syohex/emacs-git-gutter)
(el-get-bundle nschum/fringe-helper.el)
(el-get-bundle syohex/emacs-git-gutter-fringe)
(global-git-gutter-mode +1)
;(global-linum-mode)
;(setq git-gutter-fr:side 'right-fringe)
(custom-set-variables
 '(git-gutter:window-width 2)
 '(git-gutter:modified-sign "  ") ;; two spac
 '(git-gutter:added-sign "+ ")    ;; multiple character is OK
 '(git-gutter:deleted-sign "- "));
;(set-face-foreground 'git-gutter:unchanged "yellow")
;(set-face-background 'git-gutter:modified "purple") ;; background color;
;(set-face-foreground 'git-gutter:added "green")
;(set-face-foreground 'git-gutter:deleted "red")
;; line number  ... does not work with git-gutter. use git-gutter-fringe

;(setq linum-format "%d ")



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
;(el-get-bundle syohex/emacs-jazzradio)


; If Mac OS, use command key as meta key
;(when (eq system-type 'darwin)
;  (setq ns-command-modifier (quote meta));)

;(define-key global-map (kbd "C-v") 'scroll-up-command)
;(define-key global-map (kbd "M-v") 'scroll-down-command)

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
;; highlight current line
;(el-get-bundle jaspace)
;; hilight paren
(show-paren-mode 1)

;; highlight reagion
(setq transient-mark-mode t)

;; highlight edit characters
;(require 'jaspace)
;(setq jaspace-highlight-tabs t)
;(add-hook 'mmm-mode-hook 'jaspace-mmm-mode-hook)
;(setq hl-line-face 'underline) ; 下線

; get xterm-related mouse events
(xterm-mouse-mode t)
;(mouse-wheel-mode t)



;(set-scroll-bar-mode 'right)

(setq scroll-step 1)

(setq backup-inhibited t)

(setq tab-width 4)
(setq-default indent-tabs-mode nil)

; error checker
; (add-hook 'c-mode-common-hook 'flycheck-mode)

(defalias 'exit 'save-buffers-kill-emacs)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))



(set-language-environment       "Japanese")
(prefer-coding-system           'utf-8-unix)
(set-default-coding-systems     'utf-8)
(setq                           default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system  'utf-8)
(set-terminal-coding-system     'utf-8)
(set-keyboard-coding-system     'utf-8)
(set-clipboard-coding-system    'utf-8)
