Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File C:\ODTool\RunEvery5minutes.ps1", 0, True
Set objShell = Nothing