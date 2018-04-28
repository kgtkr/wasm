(module
  (import "func" "println" (func $println (param i32)))
  (import "func" "printlnString" (func $printlnString (param i32 i32)))
  (import "js" "mem" (memory 1))
  (func (export "main")
    i32.const 2
    call $malloc
    call $println
    i32.const 5
    call $malloc
    call $println
    i32.const 1
    call $malloc
    call $println
  )
  (func $malloc (param $size i32) (result i32)
    i32.const 0
    i32.load
    i32.const 1
    i32.add

    i32.const 0
    i32.const 0
    i32.load
    get_local $size
    i32.add
    i32.store
  )
)