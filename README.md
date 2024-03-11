# dotfiles
for Ubuntu

# Change folder name to english
```
LANG=C xdg-user-dirs-gtk-update
```

# Prerequired
`sudo apt install curl`

# Usege
```
USER=hogehoge PASSWORD=fugafuga bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/setup.sh)"
```

## after running script
```
. .profile
. .bashrc
```

## setup vim (once)
- execute `:PlugInstall` (molokai will be install then)

## setup byobu prefix
- ref: `https://pc.watch.impress.co.jp/docs/column/ubuntu/1444004.html`

# tips
- https://vimawesome.com/
- https://formulae.brew.sh/
- https://wonderwall.hatenablog.com/entry/rust-command-line-tools
- https://chat.openai.com/chat
