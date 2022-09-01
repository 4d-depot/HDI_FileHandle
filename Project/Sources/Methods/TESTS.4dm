//%attributes = {}
//var $folder : 4D.Folder
//var $file : 4D.File
//var $logHandle : 4D.fileHandle
//// Create a test folder and a log file inside this folder
//$folder:=Folder(Folder(fk data folder).platformPath+"TEST"+Folder separator; fk platform path)
//$folder.create()
//$file:=File($folder.platformPath+"log.txt"; fk platform path)
//$file.create()

//// Then create a handle on this file in write mode
//$logHandle:=$file.open("append")

//// Then create workers that will use this handle!
//CALL WORKER("wk1"; "DisplayLogDialog"; $logHandle)
//CALL WORKER("wk2"; "DisplayLogDialog"; $logHandle)
//CALL WORKER("wk3"; "DisplayLogDialog"; $logHandle)
//CALL WORKER("wk4"; "DisplayLogDialog"; $logHandle)

////*** Workers code ***

//// Finaly each worker will use the handle to append information at the end of the log.
//// No need towonder about file sharing or writing conflicts, the handle will manage that for you!

//(…)
//$LogLine:="anything you need to log…"
//$logHandle.writeLine($LogLine)
//(…)





