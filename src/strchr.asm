;;
;; EPITECH PROJECT, 2025
;; B-ASM-400-LYN-4-1-asmminilibc-matis.taam
;; File description:
;; strchr
;;

BITS 64                                  ; Mode 64 bits
section .note.GNU-stack noexec           ; Marque la stack comme non exécutable

section .text                            ; Section pour le code
    global strchr                        ; Point d'entrée du programme

strchr:                                  ; Étiquette de début du programme