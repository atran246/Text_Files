;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |ex 150|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.ss" "teachpack" "2htdp")))))
; Andrew Tran Ex 150
(require 2htdp/batch-io)

; List-of-strings is one of:
; empty
; (cons String List-of-strings)

; A LLS is one of: 
; – empty
; – (cons Los LLS)
; interp. a list of lines, each line is a list of strings

; Txt file -> txt file
; convert the text file into another with the articles removed
(define (remove-articles t) t)

; txt file -> txt file
; remove the articles from a txt file
(define (remove-articles*v1 t) t)

; LLS -> LLS
; remove all the articles from a list-of-a-list-of-strings
(define (remove-articles*v2 l) l)

; List-of-strings -> List-of-strings
; remove the articles from a list-of-strings
(define (remove-articles*v3 l) l)
 

 



