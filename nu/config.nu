$env.config.edit_mode = "vi"
$env.config.show_banner = false

use ($nu.default-config-dir | path join mise.nu)
