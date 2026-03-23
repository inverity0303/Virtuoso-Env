;Title: Cadence Custom Skill for exporting instance list
;Created: 2025.12.17
procedure(CCSexportInstList(@key (cv geGetEditCellView()) (win hiGetCurrentWindow()) (fname "./instance_list.txt") (hierPrefix "X") (sep ".") (hier t) (opt 0))
  let((instList hierPath adjusterHierPath hierList)
    printf("Exporting instance list to %s\n" fname)
    instList = outfile(fname)
    hierPath = geGetInstHier(win)
    if(hier then
      if(hierPath=="/" then
        adjustedHierPath=""
      else
        hierList = parseString(hierPath "/")
        adjustedHierPath = strcat(hierPrefix buildString(hierList strcat(sep hierPrefix)) sep)
        ) ;if get hier path
    else
      adjustedHierPath=""
      )
    foreach(inst cv~>instances
      unless(inst~>libName == "basic" 
        println(strcat(adjustedHierPath hierPrefix inst~>name))
        fprintf(instList "%s%s%s\n" adjustedHierPath hierPrefix inst~>name)
       ) ;unless
      ) ; foreach
    close(instList)
    printf("Exporting Finished!!!")
  );; let
);; procedure
