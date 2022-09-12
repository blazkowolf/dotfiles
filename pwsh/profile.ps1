Import-Module -Name Terminal-Icons

# oh-my-posh --init --shell pwsh --config ~/.custom.omp.yaml | Invoke-Expression
# Enable-PoshTransientPrompt

$env:Path =
  "$env:PROGRAMFILES\bat;" +
  "G:\evaldraw;" +
  "$env:PROGRAMFILES\fd;" +
  "$env:PROGRAMFILES\lf;" +
  "$env:PROGRAMFILES\hexyl;" +
  "$env:PROGRAMFILES\ripgrep;" +
  "${env:PROGRAMFILES(x86)}\VideoLAN\VLC;"+
  "${env:PROGRAMFILES(x86)}\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.31.31103\bin\Hostx64\x86;" +
  "$env:LOCALAPPDATA\Microsoft\WindowsApps" +
  $env:Path

# Argument completion
& $PSScriptRoot\Scripts\lf.ps1

# Aliases
Set-Alias winfetch pwshfetch-test-1

# PSReadLine
Import-Module -Name PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# I want Vi/Vim-like keybindings
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Cursor

# I want to search command history for commands
# starting with the currently entered text
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# I want auto-pair functionality for quotes
Set-PSReadLineKeyHandler -Chord 'Oem7','Shift+Oem7' `
                         -BriefDescription SmartInsertQuote `
                         -LongDescription "Insert paired quotes if not already on a quote" `
                         -ScriptBlock {
  param($Key, $Arg)

  $Line = $null
  $Cursor = $null
  [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$Line, [ref]$Cursor)

  if ($Line[$Cursor] -eq $Key.KeyChar) {
    # Just move the cursor
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($Cursor + 1)
  }
  else {
    # Insert matching quotes, move cursor to be in between the quotes
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($Key.KeyChar)" * 2)
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$Line, [ref]$Cursor)
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($Cursor - 1)
  }
}

# Determine if Powershell is running as Administrator
$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$CurrentPrincipal = New-Object Security.Principal.WindowsPrincipal($CurrentUser)
$IsAdmin = $CurrentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
# I want the username separate from the domain in `domain\username`
$Username = $IsAdmin ? "root" : "$(($CurrentUser.Name -Split "\\")[1])"

function Prompt {
  "[$($Username)@$(HostName.exe)] 📂$(Split-Path -Path (Get-Location) -Leaf) ❯ "
}
