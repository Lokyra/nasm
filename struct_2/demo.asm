extern printf
extern scanf

global main

section .data
  fmt_scan: db "%d", 0
  fmt_print: db "Trop jeune: %d", 10, 0
  ask:  db  "Quel est votre age: ", 0  

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
  mov rdi,fmt_print
  movzx rsi,byte[response]
  mov rax,0

  cmp byte[response], 18
  jb display
  jae fin

  display:
    call printf

  fin:
    pop rbp
    mov rax, 60 
    mov rdi, 0
    syscall
    ret
