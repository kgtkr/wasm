(module
  (import "func" "println" (func $println (param i32)))
  (import "func" "printlnString" (func $printlnString (param i32 i32)))
  (import "js" "mem" (memory 1))
  (table 1 anyfunc)
  (elem (i32.const 0) $f1)
  (func $f1 (param $x i32) (result i32)
    get_local $x
    i32.const 1
    i32.add
  )
  (type $f_i32_i32 (func (param i32) (result i32)))
  (func (export "main")
    (local $arr i32)
    (local $arr2 i32)
    i32.const 3
    call $arr_new
    set_local $arr
    get_local $arr
    i32.const 1
    i32.const 20
    call $arr_set
    get_local $arr
    i32.const 0
    call $arr_map
    set_local $arr2

    get_local $arr
    call $arr_print
    get_local $arr2
    call $arr_print
  )
  (func $arr_map (param $arr i32) (param $f i32) (result i32)
    (local $i i32)
    (local $res i32)
    get_local $arr
    call $arr_len
    call $arr_new
    set_local $res
    loop $loop
      get_local $i
      get_local $arr
      call $arr_len
      i32.lt_s
      if
        get_local $res
        get_local $i
        get_local $arr
        get_local $i
        call $arr_get
        get_local $f
        call_indirect (type $f_i32_i32)
        call $arr_set

        get_local $i
        i32.const 1
        i32.add
        set_local $i
        br $loop
      end
    end
    get_local $res
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