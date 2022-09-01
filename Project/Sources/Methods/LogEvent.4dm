//%attributes = {}
#DECLARE($logLine : Text)

CALL WORKER:C1389("W_EventLogger"; "writeLogLine"; $logLine)
