#lang racket

(define (accumulate op init items)
  (if (null? items)
      init
      (op (car items)
          (accumulate op init (cdr items)))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) (if (pair? x)
                                   (count-leaves x)
                                   1)) t)))