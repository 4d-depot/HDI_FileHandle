//%attributes = {}
var $folder : 4D:C1709.Folder
var $file : 4D:C1709.File

var $tab : Text
var $text : Text

var $global : Integer
var $chrono : Integer
var $ms : Integer
var $average : Integer

var $_log : Collection
var $_col : Collection

var $logLine : Object

var $file : 4D:C1709.File
var $fileHandle : 4D:C1709.fileHandle


$file:=File:C1566("/LOGS/hdi/log.txt"; fk posix path:K87:1)

If ($file.exists)
	
	If (Not:C34(Undefined:C82(Form:C1466.trace))) && Form:C1466.trace
		TRACE:C157
	End if 
	
	$tab:=Char:C90(Tab:K15:37)
	
	
	
	// HANDLE STARTS HERE
	
	$fileHandle:=$file.open("read")
	
	$_log:=New collection:C1472
	
	$global:=Milliseconds:C459
	$chrono:=0
	
	
	$text:=$fileHandle.readLine()
	
	While ($text#"")
		
		$_col:=Split string:C1554($text; $tab)
		
		$logLine:=New object:C1471
		
		$logLine.workerID:=$_col[0]
		$logLine.timeStamp:=$_col[1]
		$logLine.code:=$_col[2]
		$logLine.description:=$_col[3]
		If ($_col.length>=4)
			$logLine.objectName:=$_col[4]
		End if 
		
		$_log.push($logLine)
		
		$ms:=Milliseconds:C459
		$chrono:=Milliseconds:C459-$ms
		
		$text:=$fileHandle.readLine()
		
	End while 
	
	$fileHandle:=Null:C1517
	
	$global:=Milliseconds:C459-$global
	$average:=($global/$_log.length)*1000
	
	Form:C1466.report:=""
	Form:C1466.report:=Form:C1466.report+"Duration: "+String:C10($global; "##0 ms")+"\r"
	Form:C1466.report:=Form:C1466.report+"Average: "+String:C10($average; "##0 µs")+"\r"
	Form:C1466.report:=Form:C1466.report+"Imported log rows: "+String:C10($_log.length)
	
	
	Form:C1466.log:=$_log
	
Else 
	
	ALERT:C41("No log to import. Log events first !")
	
End if 
