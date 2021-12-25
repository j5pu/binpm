#  binpm

## Install 
`bash`, `git` and `man` will be installed by the installer in all but Busybox image.

Prerequisites Debian Like (slim images, i.e.: Python slim, Zsh, etc.): 
`apt update && apt install -y curl`

* **curl** [macOS, Archlinux, Centos, Fedora, Debian Like (i.e.: bullseye)]: 
`curl -fsSL https://git.io/binpm | sh -s [password]`
* **wget** [Busybox (Alpine, Bash, Bats, nix), Debian Like (i.e.: bullseye)]: 
`wget -q -O - https://git.io/binpm | sh -s [password]`
* **git**: 
`git clone https://github.com/j5pu/binpm && ./binpm/install [password]`

## Tests
### Installer 
```bash
curl -fsSL https://git.io/binpm?$(date +%s) | sh -s 
curl -H 'Cache-Control: no-cache' -fsSL https://git.io/binpm | sh -s 
```
## Links
[install raw](https://raw.githubusercontent.com/j5pu/binpm/main/install)
[install git.io](https://git.io/binpm)

