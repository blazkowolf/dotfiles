Import-Module -Name Terminal-Icons

# oh-my-posh --init --shell pwsh --config ~/.custom.omp.yaml | Invoke-Expression
# Enable-PoshTransientPrompt

$env:Path =
  "$env:PROGRAMFILES\bat;" +
  "G:\evaldraw;" +
  "$env:PROGRAMFILES\fd;" +
  "$env:PROGRAMFILES\lf;" +
  "$env:PROGRAMFILES\hexyl;" +
  "$env:PROGRAMFILES\kotlin\kotlinc\bin;" +
  "$env:PROGRAMFILES\ripgrep;" +
  "${env:PROGRAMFILES(x86)}\VideoLAN\VLC;"+
  "${env:PROGRAMFILES(x86)}\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.31.31103\bin\Hostx64\x86;" +
  "$env:LOCALAPPDATA\Microsoft\WindowsApps;" +
  $env:Path

# Argument completion
& $PSScriptRoot\Scripts\lf.ps1

# Aliases
Set-Alias -Name vim -Value neovide.exe
Set-Alias -Name winfetch -Value pwshfetch-test-1

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

$env:STARSHIP_CONFIG = "$env:LOCALAPPDATA\starship\starship.toml"
Invoke-Expression (&starship init powershell)

# Determine if Powershell is running as Administrator
# $CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
# $CurrentPrincipal = New-Object Security.Principal.WindowsPrincipal($CurrentUser)
# $IsAdmin = $CurrentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
# I want the username separate from the domain in `domain\username`
# $Username = $IsAdmin ? "root" : "$(($CurrentUser.Name -Split "\\")[1])"

# function Prompt {
#   $CurrentDir = (Convert-Path (Get-Location))
#   if ($CurrentDir.Contains($HOME)) {
#     $CurrentDir = $CurrentDir.Replace($HOME, "~")
#   }
#   $DisplayPath = $CurrentDir.Replace("\", "/").Replace(":", "").ToLower().Trim("/")
#   " $($DisplayPath) "
# }
