var $path : Text
var $page : Integer
var $pict : Picture

var $wait : Boolean
var $folder : 4D:C1709.Folder

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.documents:=ds:C1482.Documents.all().orderBy("pageNumber")
		
		Form:C1466.tabControl:=New object:C1471
		Form:C1466.tabControl.values:=Form:C1466.documents.toCollection("title").extract("title")
		Form:C1466.tabControl.index:=0
		
		
		Form:C1466.info:=Form:C1466.documents[0].comments
		
		Form:C1466.avoidBreakInsideTable:=True:C214
		Form:C1466.avoidWidowsOrfans:=True:C214
		
		Form:C1466.rb0:=1
		Form:C1466.rb1:=0
		Form:C1466.rb2:=0
		Form:C1466.rb3:=0
		
		Form:C1466.trace:=False:C215
		
		Form:C1466.countEvent:=0
		Form:C1466.logEvents:=False:C215
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		$page:=FORM Get current page:C276
		Form:C1466.info:=Form:C1466.documents[$page-1].comments
		
		Form:C1466.report:=""
		
		Form:C1466.people:=New collection:C1472
		Form:C1466.log:=New collection:C1472
		
		OBJECT SET VISIBLE:C603(*; "InfoPage@"; True:C214)
		
	: (Form event code:C388=On Unload:K2:2)
		
		
		
		$wait:=True:C214
		Repeat 
			Case of 
				: (Process state:C330(Process number:C372("wk1"))>0)
					KILL WORKER:C1390("wk1")
				: (Process state:C330(Process number:C372("wk2"))>0)
					KILL WORKER:C1390("wk2")
				: (Process state:C330(Process number:C372("wk3"))>0)
					KILL WORKER:C1390("wk3")
				: (Process state:C330(Process number:C372("wk4"))>0)
					KILL WORKER:C1390("wk4")
				: (Process state:C330(Process number:C372("W_EventLogger"))>0)
					KILL WORKER:C1390("W_EventLogger")
				Else 
					$wait:=False:C215
			End case 
		Until (Not:C34($wait))
		
		$folder:=Folder:C1567("/LOGS/hdi/")
		If ($folder.exists)
			$folder.delete(Delete with contents:K24:24)
		End if 
		
End case 
