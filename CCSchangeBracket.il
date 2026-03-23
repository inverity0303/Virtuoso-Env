;Title: CCSchangeBracket
;Description: Chage pin bracket from [] to <>
;Version: rev0.0 created in 2025.07.17
procedure(CCSchangeBracket()
	foreach(obj geGetSelSet()
		if(obj~>pin~>objType=="pin"
      then
			pinname = obj~>pin~>term~>name
	    rexCompile("\\[")
	    pinname = rexReplace(pinname "<" 0)
      rexCompile("\\]")
	    pinname = rexReplace(pinname ">" 0)
	    obj~>pin~>term~>name = pinname
		) ;end if
	) ;end foreach
) ;end procedure

