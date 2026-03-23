;Title: Cadence Custom Skill for exporting probe list
;Created: 2025.10.24
procedure(CCSexportHierName(@key (cv geGetEditCellView()) (fname "./probe_list.inc") (sep ".") (instPrefix "X"))
  let((probeList probeSet)
    printf("Exporting probe list to %s\n" fname)
    probeList = outfile(fname)
    probeSet = geGetAllProbe()
    if(probeSet
      foreach(probeNet probeSet
        println(CCSgetHierName(probeNet ?sep sep ?instPrefix instPrefix))
        fprintf(probeList CCSgetHierName(probeNet ?sep sep ?instPrefix instPrefix))
        fprintf(probeList "\n")) ; foreach
      ) ; if
    close(probeList)
    printf("Exporting Finished!!!")
  );; let
);; procedure
procedure( CCSgetHierName( probeNet @key (sep ".") (instPrefix "X") (win hiGetCurrentWindow()) )
let( (hierList hier name)
  if(probeNet~>pathList == "" then
    name = probeNet~>pathObjectName
  else 
    hierList = parseString(probeNet~>pathList "/")
    hier = buildString(hierList strcat(sep instPrefix))
    name = strcat(instPrefix hier sep probeNet~>pathObjectName)
    ) ; if top level net
  ) ; let
) ; procedure
