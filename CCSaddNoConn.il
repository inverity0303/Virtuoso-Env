;Title: CCSAddnoConn
;Description: add noConn instance in basic library for open nets
;Version: rev0.0 created on 2025.07.11
;Version: rev1.0 modified on 2026.01.26
;Version: rev2.0 modified on 2026.02.23 / add noConn to unconnected inst terminals

procedure(CCSaddNoConn()
  let((cv points loc orient numInst selSetObj objCenter pinCenter grid instBox)
    cv=geGetEditCellView()
    selSetObj=geGetSelSet()
    grid=2*schGetEnv("schSnapSpacing")
    foreach(obj selSetObj
      case(obj~>objType
        ("line"
          points=obj~>points
          objCenter=centerBox(points)
          pinCenter=centerBox(car(car(obj~>net~>instTerms)~>term~>pins)~>fig~>bBox)
          if(car(objCenter)==car(pinCenter) then ;vertical line
            if(cadr(objCenter)>cadr(pinCenter) then ; up side
              loc=cadr(points)
              orient="R180"
            else ; down side
              loc=car(points)
              orient="R0"
              )
          else if(car(objCenter)<car(pinCenter) then ;horizontal line and left side
              loc=car(points)
              orient="R270"
          else ;right side
              loc=cadr(points)
              orient="R90"
            ) ;if
          ) ; if
        numInst=obj~>net~>numBits
        dbCreateInstByMasterName(cv "basic" "noConn" "symbol" nil loc orient numInst)
        ) ;case obj is line
        ("inst"
          instBox=schGetInstSelectionBox(obj)
          instCenter=centerBox(instBox)
          foreach(instTerm obj~>instTerms
            pinCenter=centerBox(car(instTerm~>term~>pins)~>fig~>bBox)
            loc=pinCenter
            if(zerop(length(instTerm~>net~>figs))&&zerop(length(instTerm~>net~>terms)) then ; if not connected
                if(cadr(pinCenter)>=topEdge(instBox)-grid then ; if top side
                  orient="R180"
                else if(cadr(pinCenter)<=bottomEdge(instBox)+grid then ; if bottome side
                  orient="R0"
                else if(car(pinCenter)<car(instCenter) then ; if left side
                  orient="R270"
                else if(car(pinCenter)>car(instCenter) then ; if right side
                  orient="R90"
                      ) ; if right side
                    ) ;  if left side
                  ) ; if bottome side
                ) ; if top side
              numInst=obj~>numInst
              dbCreateInstByMasterName(cv "basic" "noConn" "symbol" nil loc orient numInst)
              ) ; if not connected
          ) ; foreach
        ) ; case obj is instance 
      ) ;case
    );foreach
  );let
);procedure

;procedure(CCSaddNoConn()
;  let((cv points loc wire orient numInst selSetObj)
;    cv=geGetEditCellView()
;    selSetObj=geGetSelSet()
;    foreach(wire geGetSelSet()
;      if(wire~>objType=="line"||wire~>objType=="path" then
;        points=wire~>points
;        if(caar(points)==caadr(points) then
;          loc=car(points)
;          orient="R0"
;        else
;          loc=cadr(points)
;          orient="R90"
;        )
;        numInst=wire~>net~>numBits
;        dbCreateInstByMasterName(cv "basic" "noConn" "symbol" nil loc orient numInst)
;      );if
;    );foreach
;  );let
;);procedure
