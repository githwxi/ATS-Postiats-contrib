
staload UN = "prelude/SATS/unsafe.sats"

staload "contrib/libats-/wdblair/jsmn/SATS/jsmn.sats"

implement{}
jsmntokptr_numtokens (jsv) = 
    if jsv.type = JSMN_PRIMITIVE then let
    in
        1
    end
    else if jsv.type = JSMN_STRING then let
    in
        1
    end
    else if jsv.type = JSMN_ARRAY then let
        //
        fun loop (jsv: jsmntokptr, i: int, n:int): int =
            if i = jsmntok_size (jsv) then let
            in
                n
            end
            else let
                val p = $UN.cast{ptr} (jsv)
                val ofs =  g0i2u(n)*sizeof<jsmntok_t>
                val nextjsv = $UN.cast{jsmntokptr} (add_ptr_bsz(p, ofs))
                val objectsize = jsmntokptr_numtokens (nextjsv)
                val nextoffset = n + objectsize
            in
                loop (jsv, succ (i), nextoffset)
            end
        //
    in
        loop (jsv, 0, 1)
    end
    else if jsv.type = JSMN_OBJECT then let
        
        fun loop (jsv: jsmntokptr, i: int, n: int): int =
            if i = jsmntok_size (jsv) then
                n
            else let
                val p =  $UN.cast{ptr}(jsv)
                val keyofs =  g0i2u(n)*sizeof<jsmntok_t>
                val keyjsv = $UN.cast{jsmntokptr}(add_ptr_bsz(p, keyofs))
                val keysize = jsmntokptr_numtokens (keyjsv)
                //
                val valueofs = g0i2u(n + keysize) * sizeof<jsmntok_t>
                val valuejsv = $UN.cast{jsmntokptr}(add_ptr_bsz(p, valueofs))
                val valuesize = jsmntokptr_numtokens (valuejsv)
            in
                loop (jsv, succ(i), n + keysize + valuesize)
            end
     in
         loop (jsv, 0, 1)
     end
     else let
         val () = prerrln! ("Invalid json value.")
         val () = prerrln! ("Has type: ", jsv.type)         
         val () = println! ("Invalid json value starts @ ", jsv.start)
     in
         exit(1)
     end