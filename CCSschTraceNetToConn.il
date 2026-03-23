procedure(CCSschTraceNetToConn(netName)
  prog((instTerm n bit instTermWidth instName memInsts conInst conInstBit memInst instTermName memITName)
    n = dbFindNetByName( geGetEditCellView() netName)
    unless(n return(nil) )
           printf( "Net %s has %L signals\n" n~>name n~>signals~>name )
    foreach( sig n~>signals
      when( sig~>memInstTerms
         printf( "Signal %s connects to:\n" sig~>name )
         ;printf("instanceName, termName")
      )
      foreach( memInstTerm sig~>memInstTerms
         instTerm      = car( memInstTerm )
         bit           = cadr(memInstTerm)
         instTermWidth = dbGetNameNumBit(instTerm~>name)
         instName      = instTerm~>inst~>name
         memInsts      = dbProduceMemName(instName)
         conInst       = bit/instTermWidth
         conInstBit    = bit - conInst*instTermWidth
         memInst       = nth(conInst memInsts)
         instTermName  = instTerm~>name
         memITName     = nth(conInstBit dbProduceMemName(instTermName))
         printf( "\t InstName: %s , TermName: %s \n"  memInst memITName)
         outLine = buildString((netName memInst memITName) ",")
      )
    )
    return(string)
  )
)
