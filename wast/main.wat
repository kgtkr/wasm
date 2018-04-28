(module
  (func (export "main") (result i32)
    (call $fib (i32.const 5))
  )
  (func $fib (param $n i32) (result i32)
    (local $a i32)
    (local $b i32)
    (local $i i32)
    (local $tmp i32)
    (i32.eq (get_local $n) (i32.const 0))
    if
      (i32.const 0)
      return
    end
    (set_local $a (i32.const 0))
    (set_local $b (i32.const 1))
    (set_local $i (i32.const 1))
    (block $block (loop $loop
      (br_if $block (i32.ge_u (get_local $i) (get_local $n)))
        (set_local $tmp (i32.add (get_local $a) (get_local $b)))
        (set_local $a (get_local $b))
        (set_local $b (get_local $tmp))
        (set_local $i (i32.add (get_local $i) (i32.const 1)))
      (br $loop)
    ))
    (get_local $b)
  )
)