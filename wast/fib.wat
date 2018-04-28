(module
  (import "func" "println" (func $println (param i32)))
  (import "func" "printlnString" (func $printlnString (param i32 i32)))
  (import "js" "mem" (memory 1))
  (func (export "main")
    i32.const 5
    call $fib
    call $println
  )
  (func $fib (param $n i32) (result i32)
    (local $a i32)
    (local $b i32)
    (local $i i32)
    (local $tmp i32)
    i32.const 0
    get_local $n
    i32.eq
    if
      i32.const 0
      return
    end
    i32.const 0
    set_local $a
    i32.const 1
    set_local $b
    i32.const 1
    set_local $i
    (block $block (loop $loop
      (br_if $block (i32.ge_u (get_local $i) (get_local $n)))
        get_local $b
        get_local $a
        i32.add
        set_local $tmp
        get_local $b
        set_local $a
        get_local $tmp
        set_local $b
        get_local $i
        i32.const 1
        i32.add
        set_local $i
      (br $loop)
    ))
    get_local $b
  )
)