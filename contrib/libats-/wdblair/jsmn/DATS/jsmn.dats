
staload UN = "prelude/SATS/unsafe.sats"

staload "./../SATS/jsmn.sats"

implement
jsmntokptr_numtokens (jsv) = 
    if jsv.type() = JSMN_PRIMITIVE then let
    in
        1
    end
    else if jsv.type() = JSMN_STRING then let
    in
        1
    end
    else if jsv.type() = JSMN_ARRAY orelse
               jsv.type() = JSMN_OBJECT then let
        val stop = jsv.ending()

        fun loop (jsv: jsmntokptr, n:int): int = let
            val p = $UN.cast{ptr} (jsv)
            val p = add_ptr_bsz (p, sizeof<jsmntok_t>)
            val next = $UN.cast{jsmntokptr}(p)
            val ending = next.ending()
        in
            if ending > stop orelse ending = 0 then
                n
            else 
                loop (next, succ(n))
        end
        
     in
          loop (jsv, 1)
     end
     
     else let
         val () = prerrln! ("Invalid json value.")
         val () = prerrln! ("Has type: ", jsv.type())
         val () = println! ("Invalid json value starts @ ", jsv.start())
     in
         ~1 
     end
