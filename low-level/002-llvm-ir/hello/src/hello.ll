; src/hello.ll
; Programa que imprime "Hello, World!" usando printf da libc
; e retorna 0 (sucesso).

; String constante global. [14 x i8] = 14 bytes: "Hello, World!\0A" + terminador nulo
; (13 caracteres visiveis + \n + \00)
@.str = private unnamed_addr constant [15 x i8] c"Hello, World!\0A\00"

; Declaracao externa da funcao printf (definida na libc, linkada depois)
declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  ; getelementptr pega o endereco do primeiro caractere da string global
  %str_ptr = getelementptr [15 x i8], ptr @.str, i64 0, i64 0

  ; chama printf(str_ptr) - retorno (numero de bytes escritos) e descartado
  %ret = call i32 (ptr, ...) @printf(ptr %str_ptr)

  ret i32 0
}
