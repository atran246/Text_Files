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
(check-expect (remove-articles "ttt.txt") "no-articles-ttt.txt")
(define (remove-articles t) 
  (write-file (string-append "no-articles-"  t)  
              (collapse (remove-articles*v1 t))))

; txt file -> txt file
; remove the articles from a txt file
(define (remove-articles*v1 t) 
  (remove-articles*v2 (read-words/line t)))

; LLS -> LLS
; remove all the articles from a list-of-a-list-of-strings
(check-expect (remove-articles*v2 (list (list "hello" "the" "world") 
                                        (list "a" "cat" "was" "here")))
              (list (list "hello" "world") (list "cat" "was" "here")))
(define (remove-articles*v2 l) 
  (cond
    [(empty? l) empty]
    [(cons? l) (cons (remove-articles*v3 (first l)) 
               (remove-articles*v2 (rest l)))]))


; List-of-strings -> List-of-strings
; remove the articles from a list-of-strings
(check-expect (remove-articles*v3 (list "hello" "the" "world"))
              (list "hello" "world"))
(define (remove-articles*v3 l) 
    (cond
    [(empty? l) empty]
    [(cons? l) (cond 
                  [(string=? "a" (first l)) (remove-articles*v3 (rest l))] 
                  [(string=? "an" (first l)) (remove-articles*v3 (rest l))] 
                  [(string=? "the" (first l)) (remove-articles*v3 (rest l))]
                  [else (cons (first l)
               (remove-articles*v3 (rest l)))])]))
 

;List of strings-> string
; to take a list of strings and produce one string
(check-expect (collapse  (list (list "hello" "the" "world") 
                                        (list "a" "cat" "was" "here")))
              "hello the world /n a cat was here /n ")
(define (collapse lls)
   (cond
    [(empty? lls) ""]
    [(cons? lls)(string-append (collapse* (first lls)) (collapse (rest lls)))]))

(define (collapse* l)
 (cond
   [(empty? l) "/n "]
    [(cons? l) (string-append (first l) (string-append " " (collapse* (rest l))))]))



