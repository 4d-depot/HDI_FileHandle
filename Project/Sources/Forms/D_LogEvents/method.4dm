var $docRef : Time
var $event : Object
var $size : Integer
var $LogLine : Text
var $break : Text
var $fileHandle : 4D:C1709.fileHandle

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.input1:="John"
		Form:C1466.input2:="Mike"
		Form:C1466.input3:="Andrea"
		
		Form:C1466.cb1:=True:C214
		Form:C1466.cb2:=True:C214
		Form:C1466.cb3:=True:C214
		
		Form:C1466.popup1:=New object:C1471("values"; New collection:C1472("alpha"; "bravo"; "charlie"; "delta"); "index"; 0)
		Form:C1466.slider1:=33
		Form:C1466.text:="All human beings are born free and equal in dignity and rights. They are endowed with reason and conscience and should act towards one another in a spirit of brotherhood."
		
		Form:C1466.countEvent:=0
		
		
	: (Form event code:C388=On Close Box:K2:21)
		CANCEL:C270
		
End case 


// All events are logged

$event:=FORM Event:C1606
Form:C1466.countEvent:=Form:C1466.countEvent+1

$LogLine:=String:C10(Form:C1466.workerID)+"\t"+String:C10(Timestamp:C1445)+"\t"+String:C10($event.code)+"\t"+$event.description+"\t"
If (Not:C34(Undefined:C82($event.objectName)))
	$LogLine:=$LogLine+$event.objectName
End if 


// Form.fileHandle.writeLine($LogLine)

LogEvent($logLine)

