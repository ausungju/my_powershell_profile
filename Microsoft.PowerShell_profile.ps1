function VS(){
	& 'C:\Program Files\Microsoft Visual Studio\18\Insiders\Common7\Tools\Launch-VsDevShell.ps1'
}

function Get-ChildItemColorized {
    param (
        [Parameter(ValueFromRemainingArguments=$true)]
        $Path = "."
    )
    
    $items = Get-ChildItem $Path
    $width = $host.UI.RawUI.WindowSize.Width
    $maxLength = ($items.Name | Measure-Object -Maximum Length).Maximum
    $cols = [Math]::Max(1, [int]($width / ($maxLength + 2)))
    $pad = [int]($width / $cols) - 1
    
    $i = 0
    foreach ($item in $items) {
        $i++
        $nnl = $i % $cols -ne 0
        $name = "{0,-$pad}" -f $item.Name
        
        if ($item.PSIsContainer) {
            Write-Host $name -ForegroundColor Blue -NoNewline:$nnl
        } elseif ($item.Extension -match '\.(exe|bat|cmd|ps1)$') {
            Write-Host $name -ForegroundColor Green -NoNewline:$nnl
        } else {
            Write-Host $name -NoNewline:$nnl
        }
    }
    Write-Host ""
}

Set-PSReadlineKeyHandler -Key ctrl+d -Function DeleteCharOrExit

Set-Alias -Name c -Value cls
Set-Alias -Name vim -Value nvim


$PSStyle.FileInfo.Directory = $PSStyle.Foreground.Blue
Set-Alias -Name ls -Value Get-ChildItemColorized -Option AllScope
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name la -Value Get-ChildItem

Set-Alias -Name open -Value Invoke-Item


oh-my-posh init pwsh --config ‘https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/robbyrussell.omp.json’ | Invoke-Expression

