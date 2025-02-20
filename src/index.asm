;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; index
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global index
    extern strchr

index:
    push rbp
    mov rbp, rsp

    ; wrt (with respect to) et ..plt (procedure linkage table)
    ; plt permet de faire des appels position-indépendant
    call strchr wrt ..plt
    leave
    ret
