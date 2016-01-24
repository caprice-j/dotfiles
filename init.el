
(add-to-list 'load-path "~/.emacs.d")

; for japanese
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)
(global-set-key (kbd "C-]") 'toggle-input-method)

;(set-foreground-color                                  "#CCCCCC") ; 文字色
;(set-background-color                                  "#333333") ; 背景色
;(set-cursor-color                                      "#FF0000") ; カーソル色
;(set-face-background 'region                           "#222244") ; リージョン
;(set-face-foreground 'mode-line                         "#CCCCCC") ; モードライン文字
;(set-face-background 'mode-line                         "#333333") ; モードライン背景
;(set-face-foreground 'mode-line-inactive               "#333333") ; モードライン文字(非アクティブ)
;(set-face-background 'mode-line-inactive               "#CCCCCC") ; モードライン背景(非アクティブ)
;(set-face-foreground 'font-lock-comment-delimiter-face "#888888") ; コメントデリミタ
;(set-face-foreground 'font-lock-comment-face           "#888888") ; コメント
;(set-face-foreground 'font-lock-string-face            "#7FFF7F") ; 文字列
;(set-face-foreground 'font-lock-function-name-face     "#BF7FFF") ; 関数名
;(set-face-foreground 'font-lock-keyword-face           "#FF7F7F") ; キーワード
;(set-face-foreground 'font-lock-constant-face          "#FFBF7F") ; 定数(this, selfなども)
;(set-face-foreground 'font-lock-variable-name-face     "#7F7FFF") ; 変数
;(set-face-foreground 'font-lock-type-face              "#FFFF7F") ; クラス
;(set-face-foreground 'fringe                           "#666666") ; fringe(折り返し記号なでが出る部分)
;(set-face-background 'fringe                           "#282828") ; fringe

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
(el-get-bundle anzu)
(global-anzu-mode +1)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-replace-threshold 50)
 '(anzu-replace-to-string-separator " => "))

; multi-term is a powerful terminal emulator.
; 1. It does not use C-z, C-x, C-c, C-h, C-y, and ESC.
; 2. It can invoce multiple instances.
;(el-get-bundle multi-term)

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
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
;; 拡張子が r, R の場合に R-mode を起動
(add-to-list 'auto-mode-alist '("\\.[rR]$" . R-mode))
;; R-mode を起動する時に ess-site をロード
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
;; R を起動する時に ess-site をロード
(autoload 'R "ess-site" "start R" t)


(el-get-bundle helm-etags-plus)

;(el-get-bundle elpa:magit)
;(add-to-list 'load-path "~/.emacs.d/el-get/magit/lisp")
;(global-set-key (kbd "C-x g") 'magit-status)

(el-get-bundle elpa:flycheck)

(el-get-bundle auto-complete)

(el-get-bundle syohex/emacs-git-gutter)
;(el-get-bundle nschum/fringe-helper.el)
;(el-get-bundle syohex/emacs-git-gutter-fringe)
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

;(el-get-bundle jwiegley/use-package)
; stronger than (global-set-key).
; I wanna use use-pacakge but does not work
(keyboard-translate ?\C-h ?\C-?)

(el-get-bundle emacs-helm/helm)

(helm-mode 1)
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
;(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-k")  'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f")  'helm-find-files)

; I prefer fuzzy match
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)


(el-get-bundle helm-swoop)
(global-set-key (kbd "M-s") 'helm-swoop)
(global-set-key (kbd "M-S") 'helm-swoop-back-to-last-print)

; move to helm-swoop in isearch (incremental search)
(define-key isearch-mode-map (kbd "C-s") 'helm-swoop-from-isearch)

;(define-key helm-swoop-map (kbd "C-h") 'delete-backward-char)
; move to helm-multi-swoop-all in helm-swoop
;(define-key helm-swoop-map (kbd "M-s") 'helm-multi-swoop-all-from-helm-swoop) ; does not work. why?

;; save buffer when helm-multi-swoop-edit complete
;(setq helm-multi-swoop-edit-save t)

; t -> separate in the window, nil -> use other window
(setq helm-swoop-split-with-multiple-windows t)

; separation direction
(setq helm-swoop-split-direction 'split-window-vertically)

;; if nil, faster boot and less color
(setq helm-swoop-speed-or-color nil)

; FIXME: cound not find "avy"
(el-get-bundle avy)
(el-get-bundle ace-jump-mode)
(el-get-bundle tam17aki/ace-isearch)
(global-ace-isearch-mode +1)
(setq ace-isearch-use-function-from-isearch nil)
(define-key isearch-mode-map (kbd "M-m") 'helm-multi-swoop-all-from-isearch)

; good-looking status bar
(el-get-bundle powerline)
; choose one
(powerline-default-theme)
;(powerline-center-theme)
;(powerline-vim-theme)

;(setq powerline-default-separator 'utf-8)
;(setq powerline-arrow-shape 'arrow)
;(setq powerline-default-separator 'arrow)
;(require 'init-modeline)

;set emacs color theme
(el-get-bundle emacs-jp/replace-colorthemes)
(add-to-list 'custom-theme-load-path
	     (file-name-as-directory "~/.emacs.d/el-get/replace-colorthemes/"))
;(load-theme 'desert t t)
;(load-theme 'clarity t t)
;(load-theme 'charcoal-black t t)
;(enable-theme 'charcoal-black)

; replace unusable buffer-switch
(global-set-key (kbd "C-x b") 'helm-buffers-list)
; MAYBE-LATER: installing rtags is hard
 (el-get-bundle rtags)
(el-get-bundle jixiuf/helm-etags-plus)
(custom-set-variables '(rtags-use-helm t))
(global-set-key (kbd "M-t") 'rtags-symbol-type)  ;  show type information on variables in minibuffer
(global-set-key (kbd "M-i") 'rtags-symbol-info)  ;  show type information on variablse in a separate buffer
(global-set-key (kbd "M-l") 'rtags-taglist)      ;  create a buffer of list all variables/functions 
(global-set-key (kbd "M-d") 'rtags-print-dependencies) ; show all include files. powerful!
(global-set-key (kbd "M-c") 'rtags-print-class-hierarchy) ; on subclass names?
(global-set-key (kbd "M-t") 'rtags-find-symbol)        ; go back to definition. 
(global-set-key (kbd "M-b") 'rtags-location-stack-bak) ; back for M-t
(global-set-key (kbd "M-s") 'rtags-display-summary) ; back    ; go back to definition. 
;(global-set-key (kbd "M-r") 'rtags-references-tree)       ; show usage points
(global-set-key (kbd "M-r") 'rtags-find-references)       ; show usage points
(global-set-key [f12] 'eval-buffer)                       ; on buffer of init.el, reload
(global-set-key [f11] 'describe-bindings)                 ; all key bindings

(el-get-bundle syohex/emacs-helm-ag)
(setq helm-ag-fuzzy-match t)

;(el-get-bundle emacsmirror/col-highlight) ; you need to install vline.el too
;(column-highlight-mode)
;(custom-set-faces '(col-highlight((t (:background "black")))))

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

; Since C-g is too strong, softer "excape" is needed
(global-set-key (kbd "C-M-g") 'keyboard-escape-quit)

 (global-hl-line-mode t)
; (custom-set-faces '(hl-line ((t (:background "#00FF44"))))) 
(setq hl-line-face 'underline) ; 下線
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

; M-ESC ESC is ESC ESC ESC. keyboard-quit is C-g
(global-set-key (kbd "M-ESC ESC") 'keyboard-quit)

(set-language-environment       "Japanese")
(prefer-coding-system           'utf-8-unix)
(set-default-coding-systems     'utf-8)
(setq                           default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system  'utf-8)
(set-terminal-coding-system     'utf-8)
(set-keyboard-coding-system     'utf-8)
(set-clipboard-coding-system    'utf-8)
