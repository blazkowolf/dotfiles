$ErrorActionPreference = "Stop"

mise -C $PSScriptRoot -E windows bootstrap dotfiles apply @Args
