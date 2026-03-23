;resize windows as specified
;.function Set window size
;.variable mode : 1=LHP, 2=RHP, 3=CIW, 4=CIW RHP
procedure(CCSresizeWin(mode)
	windowid = hiGetCurrentWindow()
	case( mode
		( 1 ;left half screen
		winSize=car(hiGetScreenSize()) ;Adaptive Window
		newWinSize=(nth(0 winSize)/2:nth(1 winSize)-41) ;Adaptive Window
		hiResizeWindow(windowid list(1:41 newWinSize)) ;Adaptive Window
		)
		( 2 ;right half screen
		winSize=car(hiGetScreenSize()) ;Adaptive Window
		newWinSize=(nth(0 winSize):nth(1 winSize)-41) ;Adaptive Window
		hiResizeWindow(windowid list(nth(0 winSize)/2:41 newWinSize)) ;Adaptive Window
		)
		( 3 ;full screen
		winSize=car(hiGetScreenSize()) ;Adaptive Window
		newWinSize=(nth(0 winSize):nth(1 winSize)-41) ;Adaptive Window
		hiResizeWindow(windowid list(1:41 newWinSize)) ;Adaptive Window
		)
		( 4 ;ciw lhp
		windowid = hiGetCIWindow()
		hiDeiconifyWindow(windowid)
		winSize=car(hiGetScreenSize()) ;Adaptive Window
		newWinSize=(nth(0 winSize)/2:nth(1 winSize)-50) ;Adaptive Window
		hiResizeWindow(windowid list(1:50 newWinSize)) ;Adaptive Window
		)
	hiFlush()
	) ;case
) ; procedure
