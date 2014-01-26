;-*-Lisp-*-

;; emacs version flags
(setq emacs-22 (string-match "^22\." emacs-version))
(setq emacs-23 (string-match "^23\." emacs-version))

;; lisp
(add-to-list 'load-path "~/home/.emacs.d/lisp")

(if (eq system-type 'windows-nt)
    (setq w32-quote-process-args t
	  w32-allow-system-shell t
	  shell-file-name "c:\tools\4nt.401\4nt.exe"
	  shell-command-switch "-c")
  )
(setq grep-command "egrep -in -e \"")

(setq european-calendar-style t)
(put 'narrow-to-region 'disabled nil)

(setq make-backup-files nil)
(setq default-major-mode 'text-mode)
(setq-default next-line-add-newlines nil)
(setq scroll-step 1)

(setq default-tab-width 8)
(setq-default indent-tabs-mode t)
(setq-default fill-column 80)

(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode t))
(if (fboundp 'show-paren-mode) (show-paren-mode t))
(auto-save-mode 0)

(set-background-color "gray90")
(set-foreground-color "black")
(set-face-background 'cursor "red")
(set-cursor-color "red")
(set-face-background 'region "LightSteelBlue")

;; my favourite fonts
(if (eq system-type 'windows-nt)
    (set-face-font 'default "-raster-WST_Germ-bold-r-normal-normal-24-163-106-106-c-100-ms-symbol")
  )
(if (eq system-type 'gnu/linux)
    (set-face-font 'default "-misc-fixed-bold-r-normal--15-120-100-100-c-90-iso8859-1")
  )
(if (eq system-type 'usg-unix-v)
    (set-face-font 'default "-b&h-lucida sans typewriter-bold-r-normal-sans-14-140-72-72-m-90-iso8859-1")
  )
(if (eq system-type 'darwin)
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(default ((t (:inherit nil :stipple nil :background "gray90" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco"))))
     '(font-lock-comment-face ((((class color) (background light)) (:foreground "SeaGreen"))))
     '(font-lock-constant-face ((((class color) (background light)) (:foreground "black"))))
     '(font-lock-function-name-face ((t (:foreground "black"))))
     '(font-lock-string-face ((((class color) (background light)) (:foreground "IndianRed"))))
     '(font-lock-type-face ((t (:foreground "black")))))
  )

(line-number-mode 1)
(column-number-mode t)
(global-font-lock-mode 1)
;;(if emacs-22 (setq-default truncate-lines t) (hscroll-global-mode))
(setq visible-bell t)

(setq-default case-fold-search t)
(setq-default dabbrev-case-fold-search t)
(setq-default dabbrev-case-replace nil)

;; keys
(load "pc-select")
(pc-selection-mode)
(setq pc-select-selection-keys-only t)

(setq w32-pass-alt-to-system nil)
(setq w32-pass-lwindow-to-system nil)
(setq w32-pass-rwindow-to-system nil)
(setq w32-lwindow-modifier 'meta)
(setq w32-rwindow-modifier 'super)
(setq w32-apps-modifier 'hyper)
(setq w32-enable-caps-lock t)
(setq w32-enable-num-lock nil)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'nil)
(global-unset-key [C-<])
(global-unset-key [C->])
(global-set-key [S-tab] 'indent-relative)
(global-set-key "\M-s" 'isearch-edit-string)
(global-set-key "\M--" 'dabbrev-expand)
(global-set-key "\M-#" 'goto-line)
(global-set-key [C-tab] 'electric-buffer-list)
(global-set-key "\C-x\C-q" 'toggle-read-only) ;;(global-set-key "\C-x\C-q" 'vc-toggle-read-only)
(global-set-key "\C-f" 'scroll-up)
(global-set-key "\C-b" 'scroll-down)
(global-set-key "\M-a" 'beginning-of-buffer)
(global-set-key "\M-e" 'end-of-buffer)
(global-set-key "\M-r" 'revert-buffer)

(if emacs-23
    (progn ;;(set-terminal-coding-system 'iso-latin-1)
	   ;;(set-keyboard-coding-system 'iso-latin-1)
	   ;;(prefer-coding-system 'utf-8)
	   (global-set-key [S-f12] 'yank)
	   (global-set-key [C-f12] 'copy-region-as-kill)
	   (global-set-key [S-backspace] 'kill-region)
	   (global-set-key "\M-v" 'yank)
	   (global-set-key "\M-c" 'copy-region-as-kill)
	   (global-set-key [M-backspace] 'backward-kill-word)
	   )
  )
;;(if (fboundp 'toggle-truncate-lines)
;;    (global-set-key "\M-w" 'toggle-truncate-lines)
;;  (global-set-key "\M-w" 'hscroll-global-mode)
;;  )

(load "cc-mode")
(add-to-list 'load-path "~/home/.emacs.d/lisp/mdee")
(load "mdee.el")
(load "javascript-mode")

;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (custom-set-variables
;;  '(js2-basic-offset 4))

(setq auto-mode-alist (append '(("\\.C$"       . c++-mode)
				("\\.cxx$"     . c++-mode)
				("\\.cpp$"     . c++-mode)
				("\\.idl$"     . c++-mode)
				("\\.h$"       . c++-mode)
				("\\.H$"       . c++-mode)
				("\\.hxx$"     . c++-mode)
				("\\.hdl$"     . c++-mode)
				("\\.hpp$"     . c++-mode)
				("\\.hrc$"     . c++-mode)
				("\\.HRC$"     . c++-mode)
				("\\.src$"     . c++-mode)
				("\\.SRC$"     . c++-mode)
				("\\.cs$"      . csharp-mode)
				("\\.js$"      . js-mode)
				("\\.jsm$"     . js-mode)
				("\\.scss$"    . css-mode)
				("\\.sass$"    . css-mode)
				) auto-mode-alist))

;; cc-mode hooks
(defun my-c-mode-hook ()
  (c-set-style "stroustrup")
  
  (setq compile-command "dmake debug=t\n")
  (define-key c-mode-base-map [f5] "go")
  (define-key c-mode-base-map [f6] "where")
  (define-key c-mode-base-map [S-f6] "threads")
  (define-key c-mode-base-map [C-f7] 'compile)
  (define-key c-mode-base-map [f7] 'compile)
  (define-key c-mode-base-map [f11] "step")
  (define-key c-mode-base-map [S-f11] "step up")
  (define-key c-mode-base-map [f9] "stop in")
  (define-key c-mode-base-map [f10] "next")
  ;; (define-key c-mode-base-map [f12] 'next-error)
  ;; (define-key c-mode-base-map [S-f12] 'previous-error)
  
  (setq c-font-lock-extra-types '(
      "SAL_THROW" "SAL_THROW_EXTERN_C"
      "BOOL" "BYTE" "SHORT" "USHORT" "LONG" "ULONG"
      "INT64" "UINT64" "INT32" "UINT32" "INT16" "UINT16" "INT8" "UINT8"
      "sal_Bool" "sal_Char" "sal_uChar" "sal_wChar" "sal_Unicode"
      "sal_Int8" "sal_uInt8" "sal_Int16" "sal_uInt16"
      "sal_Int32" "sal_uInt32" "sal_Int64" "sal_uInt64" "__int64"
      "sal_Handle" "sal_Size" "sal_Sequence"
      "uno_Sequence" "uno_Any"
      "boolean" "hyper" "string" "any"
      "jbyte" "jint" "jlong" "jboolean" "jchar" "jshort"
      "jfloat" "jdouble" "jobject"
      ))
  (setq c++-font-lock-extra-types (append c-font-lock-extra-types '(
      "String" "WString" "BigInt"
      "OString" "OStringBuffer" "OWString" "OUString" "OUStringBuffer"
      "Reference" "Any" "Sequence" "Type"
      "wchar_t" "auto_ptr" "size_t" "iterator" "const_iterator" "string"
      "static_int_cast"
      ;; will be out when cc-mode supports C++ with managed extensions
      "__abstract" "__box" "__delegate" "__event" "__gc" "__identifier"
      "__interface" "__nogc" "__pin" "__property" "__sealed" "__try_cast"
      "__typeof" "__value" "__finally"
      )))
  
  (setq c-block-comment-prefix)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'inextern-lang 0)
  (c-set-offset 'inline-open 0)
  )

(defun my-java-mode-hook ()
  (c-set-style "stroustrup") ;;(c-set-style "java")  
  (c-set-offset 'inline-open 0)
  )

(defun my-c-mode-common-hook ()
  (abbrev-mode t)
  (turn-on-font-lock)
  ;; (setq tab-width 4)
  (setq c-auto-newline nil)
  (c-toggle-hungry-state 1)
  (setq indent-tabs-mode nil)
  
  (define-key c-mode-base-map "\M-p" 'blink-matching-open)
  (if (fboundp 'c-context-line-break) (define-key c-mode-base-map "\C-m" 'c-context-line-break))
  )

;; install hooks
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'java-mode-hook 'my-java-mode-hook)
(add-hook 'javascript-mode-hook 'my-java-mode-hook)
(add-hook 'csharp-mode-hook 'my-java-mode-hook)

;; syntax deco
(setq-default hilit-quietly t)
;; max source len
(setq-default hilit-auto-highlight-maxout 255000)
;; font-Lock Mode
(setq font-lock-maximum-decoration 2)
(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
;;(add-hook 'php-mode-user-hook 'turn-on-font-lock)

(if emacs-23
    (progn (setq-default font-lock-support-mode 1)
;;	   (autoload 'turn-on-lazy-lock "lazy-lock")
;;	   (add-hook 'font-lock-mode-hook 'turn-on-lazy-lock)
;;	   (setq lazy-lock-minimum-size 2048)
;;	   (setq lazy-lock-defer-time 1)
	   )
  )
(load "setnu+")

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "SeaGreen"))))
 '(font-lock-constant-face ((((class color) (background light)) (:foreground "black"))))
 '(font-lock-function-name-face ((t (:foreground "black"))))
 '(font-lock-string-face ((((class color) (background light)) (:foreground "IndianRed"))))
 '(font-lock-type-face ((t (:foreground "black")))))


;; desktop
(desktop-load-default)
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(desktop-read)

;; fini
(message "=======================")

