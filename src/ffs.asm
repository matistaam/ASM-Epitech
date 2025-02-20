;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; ffs
;;

BITS 64
section .note.GNU-stack noexec

section .text
    global ffs

ffs:
    push rbp
    mov rbp, rsp

    test rdi, rdi    ; Vérifie si l'argument est null
    jz .zero

    bsf rax, rdi     ; Bit Scan Forward
    inc rax          ; ffs compte à partir de 1
    jmp .done

.zero:
    xor rax, rax

.done:
    leave
    ret
