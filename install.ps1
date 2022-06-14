$ErrorActionPreference = "Stop"

$CONFIG = "install.win.yaml"
$DOTBOT_DIR = "dotbot"

$DOTBOT_BIN = "bin/dotbot"
$BASEDIR = $PSScriptRoot

$PYTHON = "$env:LOCALAPPDATA/Programs/Python/Python310/python.exe"

Set-Location $BASEDIR
git -C $DOTBOT_DIR submodule sync --quiet --recursive
git submodule update --init --recursive $DOTBOT_DIR

    # Python redirects to Microsoft Store in Windows 10 when not installed
if (& { $ErrorActionPreference = "SilentlyContinue"
        ![string]::IsNullOrEmpty((&$PYTHON -V))
        $ErrorActionPreference = "Stop" }) {
    &$PYTHON $(Join-Path $BASEDIR -ChildPath $DOTBOT_DIR | Join-Path -ChildPath $DOTBOT_BIN) -d $BASEDIR -c $CONFIG $Args
    return
}

Write-Error "Error: Cannot find Python."
