schPinMasters = list(
    list(list("schematic" nil)  list("offSheet" t))
    list("input" "input"
        list("basic" "ipin"   "symbol")
        list("basic" "ipin"   "symbolrOff"))
    list("output" "output"
        list("basic" "opin"   "symbol")
        list("basic" "opin"   "symbollOff"))
    list("inputOutput"  "inputOutput"
        ;list("basic" "iopin"  "symbol") ;; ask to taeik
        list("basic" "iopin"  "symbolr")
        list("basic" "iopin"  "symbolrOff"))
    list("switch" "switch"
        list("basic" "iopin"  "symbolr")
        list("basic" "iopin"  "symbolrOff"))
    list("jumper" "jumper"
        list("basic" "iopin"  "symbolr")
        list("basic" "iopin"  "symbolrOff"))
    list("tristate" "tristate"
        list("basic" "iopin"  "symbolr")
        list("basic" "iopin"  "symbolrOff"))
    list("unused" "unused"
        list("basic" "iopin"  "symbolr")
        list("basic" "iopin"  "symbolrOff"))
)
