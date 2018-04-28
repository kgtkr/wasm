(module
  (import "func" "println" (func $println (param i32)))
  (import "func" "printlnString" (func $printlnString (param i32 i32)))
  (import "js" "mem" (memory 1))
  (data (i32.const 0) "println test")
  (func (export "main")
    i32.const 0
    i32.const 12
    call $printlnString
  )
)