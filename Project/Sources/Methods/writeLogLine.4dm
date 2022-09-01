//%attributes = {}

#DECLARE($logLine : Text)
var logger : cs:C1710.Logger

If (logger=Null:C1517)
	logger:=cs:C1710.Logger.new("log.txt")
End if 

logger.writeLine($logLine)








