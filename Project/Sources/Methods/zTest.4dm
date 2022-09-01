//%attributes = {}



//var $logger : cs.Logger
//var $logName : Text

//$logName:=Replace string(Timestamp; ":"; "-")+".txt"
//$logger:=cs.Logger.new($logName)

//For ($i; 1; 10)
//$logger.writeLine("test_"+String(Random))
//End for 


// No need to close the file !
// as long as the filehandle is not referenced anymore
// the file is automatically closed