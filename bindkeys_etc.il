;;-----------------------------------------------------------------------------
;; Bindkeys for 'Text Editor'
;;-----------------------------------------------------------------------------
hiSetBindKeys( "Text Editor" list(
    list("<Key>F1" "_teHelpCurrentContext()")
    list("<Key>F11" "deToggleAssistants()")
    list("Ctrl<Key>A" "_teSelectAll()")
    list("Ctrl<Key>C" "_teCopy()")
    list("Ctrl<Key>D" "_teDescendRead()")
    list("Ctrl<Key>E" "_teReturn()")
    list("Ctrl<Key>F" "_teFindNext()")
    list("Ctrl<Key>F11" "deToggleToolbars()")
    list("Ctrl<Key>G" "_teGoToLine()")
    list("Ctrl<Key>H" "_teFind()")
    list("Ctrl<Key>N" "deFileNew()")
    list("Ctrl<Key>O" "deFileOpen()")
    list("Ctrl<Key>P" "_tePrint()")
    list("Ctrl<Key>Q" "_deCloseSessionWindow()")
    list("Ctrl<Key>R" "hiRedraw()")
    list("Ctrl<Key>S" "_teSaveEdits()")
    list("Ctrl<Key>V" "_tePaste()")
    list("Ctrl<Key>W" "hiCloseWindow(hiGetCurrentWindow())")
    list("Ctrl<Key>X" "_teCut()")
    list("Ctrl<Key>Z" "_teUndo()")
    list("Shift<Key>F11" "deToggleAssistants() deToggleToolbars()")
    list("ShiftCtrl<Key>E" "_teDescendEdit()")
    list("ShiftCtrl<Key>F" "_teFindPrevious()")
    list("ShiftCtrl<Key>X" "_teSaveAndExtract()")
    list("ShiftCtrl<Key>Z" "_teRedo()")

    ;; Empty bindkeys (typically inserted when a bindkey is redefined or deleted)
    list("<Key>Escape" "")
)) ;; hiSetBindKeys
;;-----------------------------------------------------------------------------


;;-----------------------------------------------------------------------------
;; Bindkeys for 'vivaBrowser'
;;-----------------------------------------------------------------------------
hiSetBindKeys( "vivaBrowser" list(
    list("Ctrl<Key>O" "rdbShowDialog(_vivaGetSessionName() \"browser\" \"findResults\" \"show\" list((list \"pathlist\" _vivaGetSessionRootDirectory())))")
    list("Ctrl<Key>P" "_vvPlotSignals(_rdbGetSelectedResultsSignals(_vivaGetSessionName()))")
    list("Ctrl<Key>R" "rdbReloadResults(_vivaGetSessionName() _rdbGetSelectedResults(_vivaGetSessionName()))")
    list("Ctrl<Key>T" "_vvTableSignals(_rdbGetSelectedResultsSignals(_vivaGetSessionName()))")
    list("Ctrl<Key>X" "rdbUnloadResults(_vivaGetSessionName() _rdbGetSelectedResults(_vivaGetSessionName()))")
)) ;; hiSetBindKeys
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Bindkeys for 'vivaCalculator'
;;-----------------------------------------------------------------------------
hiSetBindKeys( "vivaCalculator" list(
    list("Ctrl<Key>Q" "_vvCloseCalculator(?vivaSession awvGetCurrentWindow()->vivaSession)")
    list("Ctrl<Key>X" "ddtSetCalculatorBuffer(_vivaGetSessionName() \"calc\")")
)) ;; hiSetBindKeys
;;-----------------------------------------------------------------------------

;;-----------------------------------------------------------------------------
;; Bindkeys for 'vivaGraph'
;;-----------------------------------------------------------------------------
hiSetBindKeys( "vivaGraph" list(
    list("<Key>A" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"aMarker\")")
    list("<Key>B" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"bMarker\")")
    list("<Key>C" "_vivaToggleTrackingCursor()")
    list("<Key>D" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"addMarkerCreateDelta\")")
    list("<Key>DOWN" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"panDown\")")
    list("<Key>Delete" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"deleteObjects\")")
    list("<Key>E" "_vivaDeleteAll()")
    list("<Key>Escape" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"stopPreparedMeasurementSignalListener\")")
    list("<Key>F" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"fitView\")")
    list("<Key>F11" "deToggleAssistants()")
    list("<Key>G" "_vivaToggleMinorGrids()")
    list("<Key>H" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"horizontalMarker\")")
    list("<Key>LEFT" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"panLeft\")")
    list("<Key>M" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"pointMarker\")")
    list("<Key>N" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"nextEdge\")")
    list("<Key>O" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"nextSmithGrid\")")
    list("<Key>P" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"prevEdge\")")
    list("<Key>Q" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"editAttributes\")")
    list("<Key>R" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"refPointMarker\")")
    list("<Key>RIGHT" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"panRight\")")
    list("<Key>T" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"transEdgeMarker\")")
    list("<Key>U" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"undo\")")
    list("<Key>UP" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"panUp\")")
    list("<Key>V" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"verticalMarker\")")
    list("<Key>X" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"zoomModeX\")")
    list("<Key>Y" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"zoomModeY\")")
    list("<Key>Z" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"zoomModeXY\")")
    list("<Key>[" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"zoomOut\")")
    list("<Key>]" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"zoomIn\")")
    list("Ctrl<Key>A" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"selectAllTracesInStrip\")")
    list("Ctrl<Key>E" "_vivaDeleteAllMarkers()")
    list("Ctrl<Key>F" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"fitTrace\")")
    list("Ctrl<Key>F11" "deToggleToolbars()")
    list("Ctrl<Key>L" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"graphLoadState\")")
    list("Ctrl<Key>M" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"moveTracesNewStrip\")")
    list("Ctrl<Key>N" "awvCreatePlotWindow()")
    list("Ctrl<Key>Q" "_vvCloseAllWindows(awvGetCurrentWindow()->vivaSession)")
    list("Ctrl<Key>R" "_ddtUpdateGraph(awvGetCurrentWindow()->vivaSession _vivaMapSubwinId(awvGetCurrentWindow()->vivaSession awvGetCurrentWindow() awvGetCurrentSubwindow(awvGetCurrentWindow())) nil nil)")
    list("Ctrl<Key>S" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"graphSaveState\")")
    list("Ctrl<Key>V" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"paste\")")
    list("Ctrl<Key>X" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"cut\")")
    list("Shift<Key>C" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"copy\")")
    list("Shift<Key>D" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"createDeltaMarker\")")
    list("Shift<Key>E" "_vivaDeleteAllTraces()")
    list("Shift<Key>F" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"fitSmith\")")
    list("Shift<Key>F11" "deToggleToolbars() deToggleAssistants()")
    list("Shift<Key>G" "_vivaToggleMajorGrids()")
    list("Shift<Key>N" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"nextBookmark\")")
    list("Shift<Key>P" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"prevBookmark\")")
    list("Shift<Key>Q" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"editGraphProperties\")")
    list("Shift<Key>S" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"startPreparedMeasurementSignalListener\")")
    list("Shift<Key>U" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"redo\")")
    list("ShiftCtrl<Key>A" "_ddtExecuteAction(awvGetCurrentWindow()->vivaSession \"selectAllTraces\")")
    list("<Key>," "CCSresizeWin(1)" )
    list("<Key>." "CCSresizeWin(2)" )
    list("Ctrl<Key>Up" "CCSresizeWin(3)" )
    list("<Key>~" "hiFocusToCIW()" )
)) ;; hiSetBindKeys
;;-----------------------------------------------------------------------------
