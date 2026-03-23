;Title: Cadence Custom Skill for editing bus intance/label/pin
;Created: 2025.07.08


;if no bus expression -> add suffix  <1:0> or error for minus indexing
;if bus expression -> edit bus <n:0> to <n+1:0> or <n-1:0> 
procedure(CCSresizeBusWidth(num text)
  println(num)
  println(text)
  let((txtExp newText)
  if(pcreMatchp(".*<.*>$" text)
    then  ; if has bus expression 
    txtExp = parseString(text "<:>")
    if(length(txtExp)==2
      then
      newText = buildString(list(car(txtExp) "<" pcExprToString(atoi(cadr(txtExp))+num) ":0>") "")
      else
      newText = buildString(list(car(txtExp) "<" pcExprToString(atoi(cadr(txtExp))+num) ":" caddr(txtExp) ">") "")
      )
    if((atoi(cadr(parseString(newText "<:>")))<=0) ; busexpression such as aaa<-3:0>
      then
        newText = car(txtExp)
      )
    else ; if has no bus expression
      if((num > 0)
        then
        newText = buildString(list(text "<" pcExprToString(num) ":0>") "")
        else
          error("Bus width cannot be less than zero !!!")
        )
    ) ; if
  newText ; return edited text
	) ; let
);procedure

procedure(CCSadjustBusRange(num text)
  let((txtExp newText)
  if(pcreMatchp(".*<.*>$" text)
    then  ; if has bus expression 
    txtExp = parseString(text "<:>")
    if(length(txtExp)==2
      then
      newText = buildString(list(car(txtExp) "<" pcExprToString(atoi(cadr(txtExp))+num) ">") "")
      else
      newText = buildString(list(car(txtExp) "<" pcExprToString(atoi(cadr(txtExp))+num) ":" pcExprToString(atoi(caddr(txtExp))+num) ">") "")
      ) ; if check single bus
    else ; if has no bus expression
      if((num > 0)
        then
        newText = buildString(list(text "<" pcExprToString(num) ">") "")
        else
          error("Bus width cannot be less than zero !!!")
        )
    ) ; if
  printf("Bus expression is adjusted to %s !!!", newText)
  newText ; return edited text
	) ; let
);procedure

; if objType == label or pin , edit text
procedure(CCSadjustBus(mode num)
	let((cv instName pinName labelName obj newInstName newPinName newLabelName)
    cv=geGetEditCellView()
    selObjs=geGetSelSet()
    foreach(obj selObjs
      if(obj~>objType=="inst" then
        unless(obj~>pin
          instName=obj~>name
          println("instName Editing")
          case(mode
            (1  
              newInstName=CCSadjustBusRange(num instName)
              obj~>name=newInstName)
            (2
              newInstName=CCSresizeBusWidth(num instName)
              obj~>name=newInstName)
          ) ; case
          geSelectFig(dbFindAnyInstByName(cv newInstName))
        ) ; unless
        if(obj~>pin~>objType=="pin" then
          pinName=obj~>pin~>term~>name
          case(mode
            (1
              newPinName=CCSadjustBusRange(num pinName)
              obj~>pin~>term~>name=newPinName)
            (2
              newPinName=CCSresizeBusWidth(num pinName)
              obj~>pin~>term~>name=newPinName)
          ) ; case
          geSelectFig(dbFindAnyInstByName(cv newInstName))
        ) ; if
      ) ; if
      if(obj~>objType=="label" then
        labelName=obj~>theLabel
        case(mode
          (1
            newLabelName=CCSadjustBusRange(num labelName)
            obj~>theLabel=newLabelName)
          (2
            newLabelName=CCSresizeBusWidth(num labelName)
            obj~>theLabel=newLabelName)
        ) ; case
        geSelectFig(dbFindAnyInstByName(cv newInstName))
      ) ; if
    ) t ; foreach
  ) ; let
) ; procedure
