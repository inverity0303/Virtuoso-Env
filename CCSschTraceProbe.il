;Title: CCSschTraceProbe
;Description: export information of probed net such as net name, cell name, connected instance namem, connected terminal name
;Version: rev0.0 created in 2025.09.11
procedure(CCSschTraceProbe(outFile)
  let((probeSet myPort)
    probeSet = geGetAllProbe()
    myPort = outfile(outFile)
    fprintf(myPort "NetName,CellName,InstanceName,TermName\n")
    foreach(netName probeSet~>pathObjectName
      CCSschTraceNetToConn(netName myPort))
    close(myPort)
  ) ; let
) ;procedure


procedure(CCSschTraceNetToConn(t_netName port)
  prog((instTerm n bit instTermWidth instName memInsts conInst conInstBit memInst instTermName memITName)
    n = dbFindNetByName( geGetEditCellView() t_netName)
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
         cellName      = instTerm~>inst~>cellName
         memInsts      = dbProduceMemName(instName)
         conInst       = bit/instTermWidth
         conInstBit    = bit - conInst*instTermWidth
         memInst       = nth(conInst memInsts)
         instTermName  = instTerm~>name
         memITName     = nth(conInstBit dbProduceMemName(instTermName))
         printf( "\t CellNaem: %s , InstName: %s , TermName: %s \n"  cellName memInst memITName)
         fprintf(port buildString(list(get_string(t_netName) get_string(cellName) get_string(memInst) get_string(memITName)) ","))
         fprintf(port "\n")
      )
    )
    return(t)
  )
)
