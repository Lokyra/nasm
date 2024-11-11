extern printf
extern scanf

global main

section .data
  fmt_scan: db "%d", 0
  fmt_print: db "Vous avez entre la valeur : %d", 10, 0
  ask:  db  "Entrez une valeur entiere: ", 0  

section .bss
  response : resb 1

section .text
main:
  push rbp

  mov rdi, ask
  mov rax, 0
  call printf

  mov rdi, fmt_scan
  mov rsi, response
  mov rax, 0
  call scanf
  boucle:
    mov rdi,fmt_print
    movzx rsi,byte[response]
    mov rax,0
    call printf
    dec byte[response]    
    cmp byte[response], 0
    jne boucle

  pop rbp
  mov rax, 60 
  mov rdi, 0
  syscall
  ret
