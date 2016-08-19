;;; golang-mode.el --- sample major mode for editing Go.

;; Copyright © 2016, by you

;; Author: Pedro "Darth Çeqüella" de Cavalcante ( pedro.oliveira.demolay@gmail.com )
;; Version: 1.0.0
;; Created: 14 Aug 2016

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 3.

;;; Commentary:

;; Simple highlight for Go language.

;; full doc on how to use here (TO-DO)

;;; Commentary:
;;
;; Based on derived-mode-ex.el found here:
;;
;; <http://cc-mode.sourceforge.net/derived-mode-ex.el>.
;;

;;; Code:

(defvar go-mode-hook nil)
(defvar go-mode-map
  (let ((go-mode-map (make-keymap)))
    (define-key go-mode-map "\C-j" 'newline-and-indent)
    go-mode-map)
  "Keymap for GO major mode")

(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(defconst go-font-lock-keywords-1
  (list
   ; These define the beginning and end of each GO entity definition
   ; "close" "len" "cap" "new" "make" "append" "copy" "delete" "complex" "real" "imag" "panic" "recover"
   ; "print" "println"
   '("\\<close\\>\\|\\<len\\>\\|\\<cap\\>\\|\\<new\\>\\|\\<make\\>\\|\\<append\\>\\|\\<copy\\>\\|\\<delete\\>\\|\\<complex\\>\\|\\<real\\>\\|\\<imag\\>\\|\\<panic\\>\\|\\<recover\\>\\|\\<print\\>\\|\\<println\\>" . font-lock-builtin-face)
   '("" . font-lock-variable-name-face))
  "Minimal highlighting expressions for GO mode.")

(defconst go-font-lock-keywords-2
  (append go-font-lock-keywords-1
	    (list
	     ; These are some possible attributes of GO entities
	     ; "break" "default" "func" "interface" "select" "case "defer" "go" "map" "struct"
	     ; "chan" "else" "goto" "package" "switch" "const" "falltrought" "if" "range" "type"
	     ; "continue" "for" "import" "return" "var"
	     '("\\<break\\>\\|\\<default\\>\\|\\<func\\>\\|\\<interface\\>\\|\\<select\\>\\|\\<case\\>\\|\\<defer\\>\\|\\<go\\>\\|\\<map\\>\\|\\<struct\\>\\|\\<chan\\>\\|\\<else\\>\\|\\<goto\\>\\|\\<package\\>\\|\\<switch\\>\\|\\<const\\>\\|\\<falltrought\\>\\|\\<if\\>\\|\\<range\\>\\|\\<type\\>\\|\\<continue\\>\\|\\<for\\>\\|\\<import\\>\\|\\<return\\>\\|\\<var\\>" . font-lock-keyword-face)
	     '("\\<true\\>\\|\\<false\\>\\|\\<nil\\>\\|\\<iota\\>" . font-lock-constant-face)
	     '("\\<rune\\>\\|\\<string\\>\\|\\<byte\\>\\|\\<bool\\>\\|\\<error\\>\\|\\<int\\>\\|\\<int8\\>\\|\\<int16\\>\\|\\<int32\\>\\|\\<int64\\>\\|\\<uint\\>\\|\\<uint8\\>\\|\\<uint16\\>\\|\\<uint32\\>\\|\\<uint64\\>\\|\\<uintptr\\>\\|\\<float32\\>\\|\\<float64\\>\\|\\<complex64\\>\\|\\<complex128\\>" . font-lock-type-face)))
  "Additional Keywords to highlight in GO mode.")

(defvar go-font-lock-keywords go-font-lock-keywords-2
  "Default highlighting expressions for GO mode.")

;(defun go-indent-line ()
;  "Indent current line as GO code."
;  (interactive)
;  (beginning-of-line)
;  (if (bobp)
;      (indent-line-to 0)   ; First line is always non-indented
;    (let ((not-indented t) cur-indent)
;        (if (looking-at "^[ \t}]*") ; If the line we are looking at is the end of a block, then decrease the indentation
;	      (progn
;		(save-excursion
;		    (forward-line -1)
;		      (setq cur-indent (- (current-indentation) default-tab-width)))
;		(if (< cur-indent 0) ; We can't indent past the left margin
;		    (setq cur-indent 0)))
;	  (save-excursion
;	      (while not-indented ; Iterate backwards until we find an indentation hint
;		(forward-line -1)
;		(if (looking-at "^[ \t}]*") ; This hint indicates that we need to indent at the level of the END_ token
;		    (progn
;		        (setq cur-indent (current-indentation))
;			  (setq not-indented nil))
;		    (if (looking-at "{*") ; This hint indicates that we need to indent an extra level
;			  (progn
;			    (setq cur-indent (+ (current-indentation) default-tab-width)) ; Do the actual indenting
;			    (setq not-indented nil))
;		      (if (bobp)
;			  (setq not-indented nil)))))))
;	  (if cur-indent
;	        (indent-line-to cur-indent)
;	    (indent-line-to 0))))) ; If we didn't see an indentation hint, then allow no indentation

(defvar go-mode-syntax-table
  (let ((go-mode-syntax-table (make-syntax-table)))
    
    ; This is added so entity names with underscores can be more easily parsed
    (modify-syntax-entry ?_ "w" go-mode-syntax-table)
    
    ; Comment styles are same as C++
    (modify-syntax-entry ?/ ". 124b" go-mode-syntax-table)
    (modify-syntax-entry ?* ". 23" go-mode-syntax-table)
    (modify-syntax-entry ?\n "> b" go-mode-syntax-table)
    go-mode-syntax-table)
  "Syntax table for go-mode")
  
(defun go-mode ()
  (interactive)
  (kill-all-local-variables)
  (use-local-map go-mode-map)
  (set-syntax-table go-mode-syntax-table)
  ;; Set up font-lock
  (set (make-local-variable 'font-lock-defaults) '(go-font-lock-keywords))
  ;; Register our indentation function
  ;(set (make-local-variable 'indent-line-function) 'go-indent-line)  
  (setq major-mode 'go-mode)
  (setq mode-name "Go")
  (run-hooks 'go-mode-hook))

(provide 'go-mode)

;;; golang-mode.el ends here
