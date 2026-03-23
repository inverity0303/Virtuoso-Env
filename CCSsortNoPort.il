;Title: Cadence Custom Skill for finding cell list not including power port
;Created: 2025.09.22
procedure(CCSsortNoPort(pinToFind @key (cv geGetEditCellView())
                         (file "/tmp/pinInfo.txt")
                         (hier nil))
  let((filePtr)
    printf("Searching Cell without %s Pin to %s\n" pinToFind file)
    filePtr=outfile(file)
    ;; Find hierarchical pins if user specifies hier
    if(hier then CCSpinDeep(cv filePtr pinToFind nil)
    else
      unless(lindex(cv~>terminals~>name pinToFind)
      fprintf(filePtr "=======================================================\n")
      fprintf(filePtr "LIB:%s\tCELL:%s\tVIEW:%s \n" cv~>libName cv~>cellName cv~>viewName)
      )
    ) ; if
    fprintf(filePtr "=======================================================\n")
    close(filePtr)
  );; let
);; procedure CCSgetPinInfo

procedure(CCSpinDeep(cv fileptr pinToFind visited)
  let((myMaster)
    when(and(cv dbobjectp(cv) fileptr)
      unless(lindex(cv~>terminals~>name pinToFind)
      fprintf(fileptr "\n")
      fprintf(fileptr "=======================================================\n")
      ;fprintf(fileptr "LIB:%s\tCELL:%s\tINST:%s \n"
      fprintf(fileptr "LIB:%s\tCELL:%s \n" cv~>libName cv~>cellName)
        ;cv~>libName cv~>cellName cv~>instName)
      ) ; unless
      ;; Operate on all instance headers
      foreach(header cv~>instHeaders
        myMaster= header~>master
        getWarn()
        if( myMaster
          then
          ;; Go further into hierarchy if schematic view exists
          ;; and you haven't seen it already
          if( member( "schematic" myMaster~>cell~>views~>name) && !member(myMaster visited)
            then
              visited = cons( myMaster visited)
              CCSpinDeep(dbOpenCellViewByType(header~>libName header~>cellName "schematic" "schematic") fileptr pinToFind visited)
          ) ;if
        ) ;if
      ) ;foreach
    );; when a valid cellview is supplied
  ) ;let
) ;proc
