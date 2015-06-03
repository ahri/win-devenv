Set WshShell = CreateObject("WScript.Shell")
WshShell.Run """putty\pageant.exe"" ""%USERPROFILE%\.ssh\id_rsa.ppk""", 1
WshShell.Run """putty\putty.exe"" -load Vagrant -pw vagrant", 1
