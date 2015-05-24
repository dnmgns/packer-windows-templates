:: Ensure C:\Chocolatey\bin is on the path
set /p PATH=<C:\Windows\Temp\PATH

:: Install all the things; for example:
cmd /c choco install notepadplusplus
cmd /c choco install dotnet4.5.2
cmd /c choco install vs2013.3