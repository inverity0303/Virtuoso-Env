;Title: Cadence Custom Skill for copying object's name to clipboard
;Description : 
;Version : ver0.0 created on 2026.01.22

procedure(CCScopyName(@key (win hiGetCurrentWindow()) (sep ".") (hierPrefix "X") (hier nil))
  prog((selectedObj objType inst wire hierList adjustedCurrentHier totalHierName objName)
    selectedObj = car(geGetSelectedSet())
    unless( selectedObj
      printf("Please select object.\n")
      return(nil)
      ) ;unless
    objType = selectedObj~>objType
    if(geGetInstHier(win) == "/" then
      adjustedCurrentHier = ""
    else
      hierList = parseString(geGetInstHier(win) "/")
      adjustedCurrentHier = strcat(hierPrefix buildString(hierList strcat(sep hierPrefix)))
      ) ;if
    case( objType
      ("inst"
          if( selectedObj~>purpose == "pin" then
              objName = selectedObj~>net~>name
          else
              objName = strcat(hierPrefix selectedObj~>name) ;return instance name as X_instName form.
          )
      )
      ("textDisplay"
          objName = selectedObj~>parent~>net~>name
      )
      ("line"
          objName = selectedObj~>net~>name
      )
      ("path"
          objName = selectedObj~>net~>name
      )
      ("label"
          objName = selectedObj~>theLabel
      )
      (t
      )
    )
    unless( objName
        printf("Cannot get object name. Please select instance, label or wire.\n")
        return(nil)
    )
    if( hier then
      if( adjustedCurrentHier then
          totalHierName = strcat(adjustedCurrentHier sep objName)
      else
          totalHierName = objName
      )
    else 
      totalHierName = objName
      ) ;if hier, return hierarchical name. 
    hiSetClipboard(totalHierName 'clipboard)
    return(totalHierName)
  ) ;prog
) ;procedure
