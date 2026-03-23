;Title: CCSSchSnapGrid
;Description: Rotate Snap Grid in Schematic Editor
;Version: rev0.0 created in 2025.07.11

procedure(CCSschSnapGrid(coord)
	let((snapset snapvl snapsetlen trigger index)
		snapval = hiGetCurrentWindow()~>xSnapSpacing
		snapset = list(0.00625 0.03125 0.0625 0.125)
		snapsetlen = length(snapset)
		trigger=0
		index=-1
		;scaning preset
		for(i 1 snapsetlen
		        if((nthelem(i snapset)>=snapval)
				then
		                if((trigger==0)
						then
		                	trigger=1
		                    index=i
		                );end if
		        );end if
		);end for
;		if((nthelem(index snapset) == snapval) then
;		        index=index+1
;		);end if
		;rounding
		if((coord==0) then
			index=index+1
		else 
			index=index-1
		) ;if
		if((index > snapsetlen)	then
			index=1
		);end if
		if((index==0)	then
		        index=snapsetlen
		);end if
	
		;evaluating new snap value
		hiGetCurrentWindow()~>xSnapSpacing = nthelem(index snapset)
		hiGetCurrentWindow()~>ySnapSpacing = nthelem(index snapset)
		printf("new snap value is: %L \n" nthelem(index snapset))
		geRefreshWindow( hiGetCurrentWindow() )
	) ;end let
) ;end procedure
