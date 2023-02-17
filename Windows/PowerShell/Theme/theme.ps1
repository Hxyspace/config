function set-myPrompt{
	param(
        [bool]
        $lastCommandSuccess
    )

	#喵头
	Write-Prompt "$esc[$Fore$($skyBlue)m$firstline$esc[$Fore$($white);$Back$($startgrey)m +$esc[$Fore$startgrey;$Back$($darkBlue)m$pl_left"
	
	#管理员运行时显示
    #check for elevated prompt
    If (Test-Administrator) {
        Write-Prompt "$esc[$Fore$yellow;$Back$($darkBlue)m$elevated"
    }
	
	#用户+计算机名
	$user = [System.Environment]::UserName
	if($user -eq "19098") {
		$user = "yuan"
	}
    $computer = [System.Environment]::MachineName
    if (Test-NotDefaultUser($user)) {
        Write-Prompt "$esc[$Fore$dark;$Back$($darkBlue)m$user@$computer$esc[$Fore$darkBlue;$Back$($greenwhite)m$pl_left"
    }
	
	#文件夹路径
	$path = Get-ShortPath $pwd
	#$path =$pwd
	Write-Prompt "$esc[$Fore$dark;$Back$($greenwhite)m$path$esc[$Fore$greenwhite;$Back$($endgrey)m$pl_left$esc[0m$esc[$Fore$($endgrey)m$pl_left"
	
	
	#上一个命令执行状态
    If ($lastCommandSuccess) {
        Write-Prompt "$esc[$Fore$($green)m $SuccessCommandSymbol"
    } else {
        Write-Prompt "$esc[$Fore$($red)m $FailedCommandSymbol"
    }
	
	#右边显示时间
	$dateTime = get-date -Format "HH:mm"
    Set-CursorForRightBlockWrite -textLength ($dateTime.Length + $pl_right.Length + $pl_right.Length + $elevated.Length)
    Write-Host "$esc[$Fore$($darkBlue)m$elevated$esc[$Fore$($blue)m$pl_right$esc[$Fore$midBlue;$Back$($blue)m$pl_right$esc[$Fore$white;$Back$($midBlue)m$dateTime"
	
	#另起一行
	#Set-Newline
	
	#收尾
	"$esc[0m$esc[$Fore$($skyBlue)m$secondline$EnterChar$esc[$Fore$($startgrey)m$EndChar$esc[$Fore$($yellow)m$EndChar"
}

function prompt{
	
	#上一个命令执行状态必须在这里保存，因为配置文件中执行命令的状态会覆盖用户执行的命令状态
	$lastCommand = $?
	
	set-myPrompt $lastCommand
	
}


function Write-Prompt {
	param(
        [string]
        $str
    )
	Write-Host $str -nonewline
}

function Test-NotDefaultUser($user) {
    return $null -eq $DefaultUser -or $user -ne $DefaultUser
}

function Test-Administrator {
    if ($PSVersionTable.Platform -eq 'Unix') {
        return (whoami) -eq 'root'
    }
    elseif ($PSVersionTable.Platform -eq 'Windows') {
        return $false #TO-DO: find out how to distinguish this one
    }
    else {
        return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')
    }
}

function Get-ShortPath {
    param(
        [string]
        $dir
    )
	if($dir.LastIndexOf("\") -eq $dir.Length - 1){
		return $dir.replace("\","")
	}
	return $dir.replace("$HOME","~")
}

function Set-CursorForRightBlockWrite {
    param(
        [int]
        $textLength
    )

    $rawUI = $Host.UI.RawUI
    $width = $rawUI.BufferSize.Width
    $space = $width - $textLength
    Write-Prompt "$esc[$($space)G"
}


$CatEmoji = [char]::ConvertFromUtf32(0x1f439)
$EnterChar = [char]::ConvertFromUtf32(0xf553)
$EndChar = [char]::ConvertFromUtf32(0xf054)
$pl_left = [char]::ConvertFromUtf32(0xE0B0)
$pl_right = [char]::ConvertFromUtf32(0xE0B2)
$TimeSymbol = ' ' + [char]::ConvertFromUtf32(0x235F)
$FailedCommandSymbol = [char]::ConvertFromUtf32(0x2718)
$SuccessCommandSymbol = [char]::ConvertFromUtf32(0x2713)
$firstline = [char]::ConvertFromUtf32(0x256d)
$secondline =  [char]::ConvertFromUtf32(0x2570)
$elevated = [char]::ConvertFromUtf32(0x26a1)

$esc = [char]27
$space = [char]32


$Fore = "38;2;"
$Back = "48;2;"

$dark = "0;0;0"
$white = "238;238;236"
$red = "255;0;95"
$startgrey = "108;108;108"
$skyBlue = "0;95;255"
$blue = "114;159;207"
$midBlue = "52;101;164"
$darkBlue = "114;159;207"
$green = "135;215;0"
$greenwhite = "175;215;215"
$endgrey = "128;128;128"
$yellow = "255;175;0"
