//%attributes = {}
// Char(Line feed)

var $folder : 4D:C1709.Folder
var $file : 4D:C1709.File
var $fileHandle : 4D:C1709.FileHandle  // ∆∆∆
var $people : cs:C1710.PeopleSelection
var $person : cs:C1710.PeopleEntity

var $global : Integer
var $chrono : Integer
var $ms : Integer
var $average : Integer
var $size : Integer

var $tab : Text
var $text : Text

$folder:=Folder:C1567(Folder:C1567(fk data folder:K87:12).platformPath+"Tests"+Folder separator:K24:12; fk platform path:K87:2)
If (Not:C34($folder.exists))
	$folder.create()
End if 

$file:=File:C1566($folder.platformPath+"export.txt"; fk platform path:K87:2)
If ($file.exists)
	$file.delete()
End if 
$file.create()

If (Not:C34(Undefined:C82(Form:C1466.trace))) && Form:C1466.trace
	TRACE:C157
End if 


// HANDLE STARTS HERE

$fileHandle:=$file.open("write")  // ∆∆∆∆∆∆ HANDLE ∆∆∆∆∆∆

/*
.mode="read", "write"or"append"
.charset=charsetName or charsetNum
.breakModeRead=defines the break mode to be written in 4D Variable(translated from the breaks of the file)
.breakModeWrite=defines the break mode to be written in the file(translated from the breaks of 4D Variable)

$o:=New object
$o.mode:="append"
$o.chatset:="UTF-8"
$o.breakModeRead:=Document with CR
$o.breakModeWrite:=Document with LF
$fileHandle:=$file.open($o)

*/

$tab:=Char:C90(Tab:K15:37)
$people:=ds:C1482.People.all()

$global:=Milliseconds:C459
$chrono:=0


For each ($person; $people)
	
	$text:=String:C10($person.ID)+$tab\
		+$person.lastname+$tab\
		+$person.firstname+$tab\
		+$person.city+$tab\
		+$person.phone+$tab\
		+String:C10($chrono; "##0 ms")+$tab\
		+Timestamp:C1445
	
	$ms:=Milliseconds:C459
	$fileHandle.writeLine($text)  // // ∆∆∆∆∆∆ HANDLE ∆∆∆∆∆∆
	
	//$fileHandle.offset:=$fileHandle.getSize()
	
	$chrono:=Milliseconds:C459-$ms
	
End for each 

$fileHandle:=Null:C1517  // ∆∆∆∆∆∆ HANDLE ∆∆∆∆∆∆

$global:=Milliseconds:C459-$global
$average:=($global/$people.length)*1000

Form:C1466.report:=""

Form:C1466.report:=Form:C1466.report+"Duration: "+String:C10($global; "##0 ms")+"\r"
Form:C1466.report:=Form:C1466.report+"Average: "+String:C10($average; "##0 µs")+"\r"
Form:C1466.report:=Form:C1466.report+"Exported entities: "+String:C10($people.length)

