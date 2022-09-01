//%attributes = {}
#DECLARE($workerID : Integer; $fileHandle : 4D:C1709.fileHandle)

var $window : Integer
var $o : Object

Case of 
	: ($workerID=1)
		$window:=Open form window:C675("D_LogEvents"; Plain form window:K39:10; On the left:K39:2; At the top:K39:5)
	: ($workerID=2)
		$window:=Open form window:C675("D_LogEvents"; Plain form window:K39:10; On the right:K39:3; At the top:K39:5)
	: ($workerID=3)
		$window:=Open form window:C675("D_LogEvents"; Plain form window:K39:10; On the left:K39:2; At the bottom:K39:6)
	: ($workerID=4)
		$window:=Open form window:C675("D_LogEvents"; Plain form window:K39:10; On the right:K39:3; At the bottom:K39:6)
End case 

$o:=New object:C1471("workerID"; $workerID)

DIALOG:C40("D_LogEvents"; $o; *)

//CLOSE WINDOW($window)

