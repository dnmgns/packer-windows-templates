#this next row is from the original script from dylanmei, it also fails
#iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

#this one also fails
$ChocoInstallPath = "$env:SystemDrive\Chocolatey\bin"

Write-Host "Choco install path is `'$ChocoInstallPath`'"

# Put chocolatey on the MACHINE path
$envPath = $env:PATH
if (!$envPath.ToLower().Contains($ChocoInstallPath.ToLower())) {
    Write-Host "PATH environment variable does not have `'$ChocoInstallPath`' in it. Adding..."
    $ActualPath = [Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::Machine)
    $StatementTerminator = ";"
    $HasStatementTerminator = $ActualPath -ne $null -and $ActualPath.EndsWith($StatementTerminator)
    If (!$HasStatementTerminator -and $ActualPath -ne $null) {$ChocoInstallPath = $StatementTerminator + $ChocoInstallPath}
    if (!$ChocoInstallPath.EndsWith($StatementTerminator)) {$ChocoInstallPath += $StatementTerminator}

    [Environment]::SetEnvironmentVariable('Path', $ActualPath + $ChocoInstallPath, [System.EnvironmentVariableTarget]::Machine)
}

$env:Path += ";$ChocoInstallPath"

if (!(Test-Path $ChocoInstallPath)) {
  # Install chocolatey
  iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}
