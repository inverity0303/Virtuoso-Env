;Title: Cadence Custom Skill for listing net name that is differ from term name
;Created: 2025.11.28
procedure(CCSlistTermNet(term @key (cv geGetEditCellView())
                         (file "term_list1.txt")
                         (hier nil))
  let((filePtr termList netName matchedTerm)
    ;printf("Searching Cell without %s Pin to %s\n" term file)
    filePtr=outfile(file)
    fprintf(filePtr "Netname that is connected to terminal %s in %s \n" term cv~>cellName)
    fprintf(filePtr "parent cell name, instance name,cell name,connected netname \n")
    if(hier then
      CCStermDeep(cv filePtr term nil)
    else
      foreach(inst cv~>instances
        if(inst~>instTerms  then
          matchedTerm = setof(termList inst~>instTerms termList~>name==term)
          if(matchedTerm  then
            netName = car(matchedTerm~>net~>name)
            if(netName != term  then
              fprintf(filePtr "%s,%s,%s,%s\n" cv~>cellName inst~>name inst~>cellName netName)
              ) ;if netName differs from termName
          ) ;if matchedTerm
        )
      ) ; foreach
    ) ;if hier
    close(filePtr)
  );; let
);; procedure CCSlistTermNet

procedure(CCStermDeep(cv fileptr term visited)
  let((myMaster)
    when(and(cv dbobjectp(cv) fileptr)
      foreach(inst cv~>instances
        if(inst~>instTerms then
          matchedTerm = setof(termList inst~>instTerms termList~>name==term)
          if(matchedTerm then
            netName = car(matchedTerm~>net~>name)
            if(netName != term then
              ;netName = parseString(geGetInstHier(inst))
              ;printf("HeirPath:%s" db )
              fprintf(filePtr "%s,%s,%s,%s\n" cv~>cellName inst~>name inst~>cellName netName)
              ;fprintf(filePtr "%s,%s,%s\n" inst~>name inst~>cellName CCSgetHierName(netName ?instPrefix ""))
            )
          )
        )
      ) ; foreach
      ;; Operate on all instance headers
      foreach(header cv~>instHeaders
        myMaster= header~>master
        getWarn()
        if( myMaster then
          ;; Go further into hierarchy if schematic view exists
          ;; and you haven't seen it already
          if( member( "schematic" myMaster~>cell~>views~>name) && !member(myMaster visited) then
            visited = cons( myMaster visited)
            ;fprintf(fileptr "HierPath:%s \n" car(header~>instances~>name))
            CCStermDeep(dbOpenCellViewByType(header~>libName header~>cellName "schematic" "schematic") fileptr term visited)
          ) ;if
        ) ;if
      ) ;foreach
    );; when a valid cellview is supplied
  ) ;let
) ;proc
