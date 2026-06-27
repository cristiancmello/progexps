; src/zero.ll
; Programa simples que retorna 0 (codigo de saida = sucesso)
; Escrito diretamente em LLVM IR, sem depender de arquitetura especifica.

define i32 @main() {
entry:
  ret i32 0
}
