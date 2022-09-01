Class extends Entity

Function get fullname($event : Object)->$fullname : Text
	
	Case of 
		: (This:C1470.firstname=Null:C1517) & (This:C1470.lastname=Null:C1517)
			$fullname:=""
		: (This:C1470.firstname=Null:C1517)
			$fullname:=This:C1470.lastname
		: (This:C1470.lastname=Null:C1517)
			$fullname:=This:C1470.firstname
		Else 
			$fullname:=This:C1470.firstname+" "+This:C1470.lastname
	End case 
	
	
	