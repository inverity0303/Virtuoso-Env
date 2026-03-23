;Title: Cadence Custom Skill for exporting cell list
;Created: 2025.12.17
procedure(CCSexportCellList(@key (cv geGetEditCellView()) (fname "./cell_list.txt"))
  let((cellList)
    printf("Exporting cell list to %s\n" fname)
    cellList = outfile(fname)
    foreach(cell cv~>instHeaders
      unless(cell~>libName == "basic" 
        println(cell~>cellName)
        fprintf(cellList "%s\n" cell~>cellName)
       ) ;unless
      ) ; foreach
    close(cellList)
    printf("Exporting Finished!!!")
  );; let
);; procedure
