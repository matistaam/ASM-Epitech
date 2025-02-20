;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; rindex
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global rindex
    extern strrchr

rindex:
    push rbp
    mov rbp, rsp

    call strrchr wrt ..plt
    leave
    ret
