

Class constructor($logName : Text)
	
	var $file : 4D:C1709.File
	
	$file:=File:C1566("/LOGS/hdi/"+$logName)
	$file.parent.create()  // check that parents exists; Otherwise it creates it.
	This:C1470.fh:=$file.open("append")
	
	
Function writeLine($logText : Text)
	
	This:C1470.fh.writeLine($logText)
	
	
	