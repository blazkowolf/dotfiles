# dotfiles

Configuration files for applications installed on my computers

## Installation

### Linux (or WSL)

```sh
./install
```

The installer runs `mise -E linux bootstrap dotfiles apply` and reads the
platform-specific entries from `mise.linux.toml`.

### Windows

_Run in an administrator PowerShell prompt_

```sh
.\install.ps1
```

The PowerShell installer runs `mise -E windows bootstrap dotfiles apply` and
reads the platform-specific entries from `mise.windows.toml`.
