//%attributes = {}
// TO BE MODIFIED FOR FILE HANDLES

var $folder : 4D:C1709.Folder
var $file : 4D:C1709.File


var $tab : Text
var $text : Text

var $global : Integer
var $chrono : Integer
var $ms : Integer
var $average : Integer

var $docRef : Time

var $_people : Collection
var $col : Collection

var $person : cs:C1710.PeopleEntity
var $fileHandle : 4D:C1709.fileHandle

$folder:=Folder:C1567(Folder:C1567(fk data folder:K87:12).platformPath+"Tests"+Folder separator:K24:12; fk platform path:K87:2)
$file:=File:C1566($folder.platformPath+"export.txt"; fk platform path:K87:2)


If ($file.exists)
	
	If (Not:C34(Undefined:C82(Form:C1466.trace))) && Form:C1466.trace
		TRACE:C157
	End if 
	
	$tab:=Char:C90(Tab:K15:37)
	
	// HANDLE STARTS HERE
	
	$fileHandle:=$file.open("read")  // ∆∆∆∆∆∆ HANDLE ∆∆∆∆∆∆
	$_people:=New collection:C1472
	
	$global:=Milliseconds:C459
	$chrono:=0
	
	//$text:=$fileHandle.readLine()
	
	While (Not:C34($fileHandle.eof))  // eof = end of file
		
		$text:=$fileHandle.readLine()  // ∆∆∆∆∆∆ HANDLE ∆∆∆∆∆∆
		
		$col:=Split string:C1554($text; $tab)
		
		$person:=New object:C1471
		
		$person.ID:=$col[0]
		$person.lastname:=$col[1]
		$person.firstname:=$col[2]
		$person.city:=$col[3]
		$person.phone:=$col[4]
		$person.chrono:=$col[5]
		$person.timestamp:=$col[6]
		
		$_people.push($person)
		
		$ms:=Milliseconds:C459
		$chrono:=Milliseconds:C459-$ms
		
	End while 
	
	$fileHandle:=Null:C1517  // ∆∆∆∆∆∆ HANDLE ∆∆∆∆∆∆
	
	$global:=Milliseconds:C459-$global
	$average:=($global/$_people.length)*1000
	
	Form:C1466.report:=""
	Form:C1466.report:=Form:C1466.report+"Duration: "+String:C10($global; "##0 ms")+"\r"
	Form:C1466.report:=Form:C1466.report+"Average: "+String:C10($average; "##0 µs")+"\r"
	Form:C1466.report:=Form:C1466.report+"Imported entities: "+String:C10($_people.length)
	
	Form:C1466.people:=$_people
	
Else 
	
	ALERT:C41("No file to import. Export first !")
	
End if 
