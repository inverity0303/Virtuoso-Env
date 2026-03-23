let( (fname (CCSrootDir "/user/yunseong.jo/myskill"))
  ;CCSrootDir = strcat( pwd() CCSrootDir)
  ;CCSrootDir = strcat( CCSrootDir)
  unless( isDir(CCSrootDir)
    error("Unable to locate custom SKILL directory: %s\n" CCSrootDir)
  ) ; unless
  ;;;;; load all files with prefix "CCS" and suffix ".il" ;;;;;;
  info("*** Start loading SKILL customization...\n")
  foreach( file sort(getDirFiles(CCSrootDir) 'alphalessp)
    when( index(file "CCS")==file && index(file ".il")==".il"
      ;info("***   - %s\n file")
      loadi(strcat(CCSrootDir "/" file))
    ) ; when
  ) ; foreach
    info("*** End of SKILL customization.\n")
) ; let
