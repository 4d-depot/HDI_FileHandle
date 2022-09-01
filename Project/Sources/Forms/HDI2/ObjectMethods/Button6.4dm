
OBJECT SET VISIBLE:C603(*; "InfoPage4_@"; False:C215)

If (Not:C34(Undefined:C82(Form:C1466.trace))) && Form:C1466.trace
	TRACE:C157
End if 

//log info sent to the test dialog

CALL WORKER:C1389("wk1"; "DisplayLogDialog"; 1)
CALL WORKER:C1389("wk2"; "DisplayLogDialog"; 2)
CALL WORKER:C1389("wk3"; "DisplayLogDialog"; 3)
CALL WORKER:C1389("wk4"; "DisplayLogDialog"; 4)
