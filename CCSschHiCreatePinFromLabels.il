;Title : misc cadence skill for schematic editor / create pins from selected labels
;Created : 2025.07.08
procedure( CCSschHiCreatePinFromLabels()
  let((selLabel lblList lbltxt)
    lblList=nil
    foreach( selLabel geGetSelSet()
      if( selLabel~>objType=="label" then
        lbltxt=selLabel~>theLabel
        lblList=append(lblList list(lbltxt))
        ) ; if
      ) ; foreach
    labels=buildString(lblList)
    schHiCreatePin(?terminalName labels)
    ) ; let
)
