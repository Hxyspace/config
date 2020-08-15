function getFileName{	#显示目录下文件名
    Get-ChildItem -exclude ".*" | Format-Wide -autosize
}
function getHiddenFileName{   #显示目录隐藏文件
    Get-ChildItem | Format-Wide -autosize
}
Remove-Item alias:\ls
Set-Alias ls getFileName
Set-Alias ls-l Get-ChildItem
Set-Alias ls-a getHiddenFileName

#. "$PSScriptRoot\theme.ps1"
$ThemePath="$PSScriptRoot\\Theme"