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


;;; Code:
(require 'generic-x)

(define-generic-mode 'go-mode                   ;; name of the mode
  '("//")
  '("break" "default" "func" 
    "interface" "select" "case" 
    "defer" "go" "map" "struct" 
    "chan" "else" "goto" "package" 
    "switch" "const" "fallthrough" 
    "if" "range" "type" "continue" 
    "for" "import" "return" "var")              ;; some keywords
  
  '(
    ("nil" . 'font-lock-constant-face)
    ("\\<make\\>\\|\\<close\\>\\|\\<len\\>\\|\\<cap\\>\\|\\<new\\>\\|\\<append\\>\\|\\<copy\\>\\|\\<delete\\>\\|\\<complex\\>\\|\\<real\\>\\|\\<imag\\>\\|\\<panic\\>\\|\\<recover\\>" . 'font-lock-builtin-face)
    ("\\<int\\>\\|\\<int8\\>\\|\\<int16\\>\\|\\<int32\\>\\|\\<int64\\>\\|\\<uint\\>\\|\\<uint8\\>\\|\\<uint16\\>\\|\\<uint32\\>\\|\\<uint64\\>\\|\\<float32\\>\\|\\<float64\\>\\|\\<complex64\\>\\|\\<complex128\\>\\|\\<byte\\>\\|\\<rune\\>\\|\\<bool\\>\\|\\<uintptr\\>\\|\\<string\\>" . 'font-lock-type-face))
  '("\\.go$")                                   ;; files that trigger this mode
  nil                                           ;; any other functions to call
  "Go languange highlight mode"                 ;; doc string
)

;; Local Variables:
;; coding: utf-8
;; End:

;;; golang-mode.el ends here

