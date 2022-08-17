Import-Module -Name Terminal-Icons

# oh-my-posh --init --shell pwsh --config ~/.custom.omp.yaml | Invoke-Expression
# Enable-PoshTransientPrompt

$env:Path =
  "$env:PROGRAMFILES\bat;" +
  "$env:PROGRAMFILES\fd;" +
  "$env:PROGRAMFILES\lf;" +
  "$env:PROGRAMFILES\ripgrep;" +
  "${env:PROGRAMFILES(x86)}\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.31.31103\bin\Hostx64\x86;" +
  "$env:LOCALAPPDATA\Microsoft\WindowsApps\Microsoft.PowerShell_8wekyb3d8bbwe;" +
  $env:Path

# PSReadLine
Import-Module PSReadLine

# I want Vi/Vim-like keybindings
Set-PSReadLineOption -EditMode Vi

# I want to search command history for commands
# starting with the currently entered text
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# I want auto-pair functionality for quotes
Set-PSReadLineKeyHandler -Chord 'Oem7','Shift+Oem7' `
                         -BriefDescription SmartInsertQuote `
                         -LongDescription "Insert paired quotes if not already on a quote" `
                         -ScriptBlock {
  param($key, $arg)

  $line = $null
  $cursor = $null
  [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

  if ($line[$cursor] -eq $key.KeyChar) {
    # Just move the cursor
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
  }
  else {
    # Insert matching quotes, move cursor to be in between the quotes
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
  }
}

# function Prompt
# {
#   # Determine if Powershell is running as Administrator
#   $CurrentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
#   $IsAdmin = $CurrentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
# }
