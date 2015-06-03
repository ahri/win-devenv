Set WshShell = CreateObject("WScript.Shell")
Home = WshShell.ExpandEnvironmentStrings("%USERPROFILE%")
WshShell.Run """putty\puttygen.exe"" ""%USERPROFILE%\.ssh\id_rsa"" -o ""%USERPROFILE%\.ssh\id_rsa.ppk""", 0
