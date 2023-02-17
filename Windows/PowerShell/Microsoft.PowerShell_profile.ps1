function getFileName{	#显示目录下文件名
    Get-ChildItem -exclude ".*" | Format-Wide -autosize
}
function getHiddenFileName{   #显示目录隐藏文件
    Get-ChildItem | Format-Wide -autosize
}
Remove-Item alias:\ls
Set-Alias ls getFileName
Set-Alias ll Get-ChildItem
Set-Alias la getHiddenFileName

#. "$PSScriptRoot\theme.ps1"
$ThemePath="$PSScriptRoot\\Theme"
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
