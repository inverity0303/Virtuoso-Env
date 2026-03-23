;Title: CCSshortPin
;Description: Short 2 pins of selected instances with designated net name
;Version: rev0.0 created in 2025.07.10
procedure(CCSshortPin(pinName1 pinName2 labelName)
	let((instList cv)
		cv=geGetEditCellView()
		instList=geGetSelSet()
		if(instList
			then
		 		CCScreateWireBtwPins(cv instList pinName1 pinName2 labelName)
				;schCheck(cv)
		else printf("Instance not selected")
		)
	) ;let
) ;proc

procedure(CCScreateWireBtwPins(cv instList pinName1 pinName2 labelName)
	let( ( grid selBox ibox dir wireDir lab_x lab_y instTermbBox xa xb ya yb x1 y1 x1 y2 instTermList1 instTermList2 actualList1 actualList2 mywire )
	foreach(inst instList
	;; This section is to filter out instTerms with external connections
		instTermList1 =setof(x inst~>instTerms x~>name==pinName1)
		actualLis1t1 = nil
		foreach(term instTermList1
        	unless(term~>net~>figs
				actualList1 = reverse(append( list(term) actualList1))
                ) ;unless
		) ;foreach
        foreach(ter actualList1
			unless(ter~>net~>figs
				;; need to get the origin for the instPins
                instTermbBox = dbTransformBBox(car(ter~>term~>pins~>fig~>bBox) inst~>transform)
                ;; calculate the center of instTerm
                xa = caar(instTermbBox)
                xb = caadr(instTermbBox)
                ya = cadar(instTermbBox)
                yb = cadadr(instTermbBox)
                x1 = (xa + xb)/2
                y1 = (ya + yb)/2
				) ;unless
		) ;foreach
		instTermList2 =setof(x inst~>instTerms x~>name==pinName2)
		actualList2 = nil
		foreach(term instTermList2
        	unless(term~>net~>figs
				actualList2 = reverse(append( list(term) actualList2))
                ) ;unless
		) ;foreach
        foreach(ter actualList2
			unless(ter~>net~>figs
				;; need to get the origin for the instPins
                instTermbBox = dbTransformBBox(car(ter~>term~>pins~>fig~>bBox) inst~>transform)
                ;; calculate the center of instTerm
                xa = caar(instTermbBox)
                xb = caadr(instTermbBox)
                ya = cadar(instTermbBox)
                yb = cadadr(instTermbBox)
                x2 = (xa + xb)/2
                y2 = (ya + yb)/2
                        );unless
            );foreach actualList
		
		dir="R0"
		wireDir=list(x1:y1 x2:y2)
		lab_x=x1
		lab_y=y1+0.04
		mywire=schCreateWire(cv "draw" "full" wireDir 0.03125 0.03125 0.0)
		schCreateWireLabel(cv car(mywire) lab_x:lab_y labelName "lowerLeft" dir "stick" 0.0625 nil)
		); foreach instList
	printf("\nDONE\n")

	);let
);procedure
;		selBox=setof(x inst~>master~>shapes x~>lpp=='("instance" "drawing"))
;				ibox=geTransformUserBBox(car(selBox)~>bBox inst~>transform)
;				left_E=leftEdge(ibox)
;				right_E=rightEdge(ibox)
;				top_E=topEdge(ibox)
;				bot_E=bottomEdge(ibox)
			;	grid=2*schGetEnv("schSnapSpacing")
				;cond(
;            ((x1-grid)<left_E
;            dir="R180"
;            wireDir=list(x1:y1 x1-0.3:y1)
;            lab_x=x1-0.04
;            lab_y=y1
;            ) ;left_Edge
;        
;            ((x1+grid)>right_E
;            dir="R0"
;            wireDir=list(x1:y1 x1+0.3:y1)
;            lab_x=x1+0.04
;            lab_y=y1
;            ) ; right_Edge
;        
;            ((y1-grid)<bot_E
;            dir="R270"
;            wireDir=list(x1:y1 x1:y1-0.3)
;            lab_x=x1
;            lab_y=y1-0.04
;            ) ; bottom_Edge
;        
;            ((y1+grid)>top_E
;            dir="R90"
;            wireDir=list(x1:y1 x1:y1+0.3)
;            lab_x=x1
;            lab_y=y1+0.04
;            ) ; top_Edge
;        
;            (t
;            dir="R0"
;            wireDir=list(x1:y1 x1+0.3:y1)
;            lab_x=x1+0.04
;            lab_y=y1
;            ) ; default
;) ;cond


