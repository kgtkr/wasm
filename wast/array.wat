(module
  (import "func" "println" (func $println (param i32)))
  (import "func" "printlnString" (func $printlnString (param i32 i32)))
  (import "js" "mem" (memory 1))
  (func (export "main")
    (local $arr i32)
    (set_local $arr (call $arr_new (i32.const 3)))

    (call $arr_set (get_local $arr) (i32.const 1) (i32.const 20))
    (call $arr_print (get_local $arr))
  )
  (func $arr_print (param $arr i32)
    (local $i i32)
    loop $loop
      get_local $i
      get_local $arr
      call $arr_len
      i32.lt_s
      if
        get_local $arr
        get_local $i
        call $arr_get
        call $println

        get_local $i
        i32.const 1
        i32.add
        set_local $i
        br $loop
      end
    end
  )
  (func $arr_len (param $arr i32) (result i32)
    get_local $arr
    i32.load
  )
  (func $arr_get (param $arr i32) (param $index i32) (result i32)
    get_local $arr
    get_local $index
    call $arr_index_address
    i32.load
  )
  (func $arr_index_address (param $arr i32) (param $index i32) (result i32)
    i32.const 4
    get_local $arr
    get_local $index
    i32.const 4
    i32.mul
    i32.add
    i32.add
  )
  (func $arr_set (param $arr i32) (param $index i32) (param $value i32)
    get_local $arr
    get_local $index
    call $arr_index_address
    get_local $value
    i32.store
  )
  (func $arr_new (param $len i32) (result i32)
    (local $arr i32)
    i32.const 4
    get_local $len
    i32.const 4
    i32.mul
    i32.add
    call $malloc
    set_local $arr
    get_local $arr
    get_local $len
    i32.store
    get_local $arr
  )
  (func $malloc (param $size i32) (result i32)
    i32.const 0
    i32.load
    i32.const 0
    i32.eq
    if
      i32.const 0
      i32.const 3
      i32.store
    end
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