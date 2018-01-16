#!/bin/sh
if test "$(which code)"; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi

	ln -sf "$DOTFILES_ROOT/topics/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
	ln -sf "$DOTFILES_ROOT/topics/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	ln -sf "$DOTFILES_ROOT/topics/vscode/snippets" "$VSCODE_HOME/User/snippets"

	# from `code --list-extensions`
	modules="
CoenraadS.bracket-pair-colorizer
EditorConfig.EditorConfig
HookyQR.beautify
PKief.material-icon-theme
akamud.vscode-theme-onedark
PeterJausovec.vscode-docker
be5invis.toml
caarlos0.language-prometheus
esbenp.prettier-vscode
formulahendry.auto-close-tag
formulahendry.auto-rename-tag
haaaad.ansible
ipedrazas.kubernetes-snippets
lukehoban.Go
mauve.terraform
ms-python.python
patbenatar.advanced-new-file
rebornix.Ruby
rust-lang.rust
sbrink.elm
shanoor.vscode-nginx
donjayamanne.jupyter
searKing.preview-vscode
yzhang.markdown-all-in-one
"
	for module in $modules; do
		code --install-extension "$module" || true
	done
fi
