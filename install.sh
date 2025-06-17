#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/mesamirh/Terminal-Motivation.git"
INSTALL_DIR="$HOME/.terminal-motivation"
SCRIPT_PATH="$INSTALL_DIR/index.js"

echo "Installing Terminal Motivation..."

if [ ! -d "$INSTALL_DIR" ]; then
  git clone "$REPO_URL" "$INSTALL_DIR"
else
  echo "Updating existing installation..."
  cd "$INSTALL_DIR" && git pull
fi

if ! head -1 "$SCRIPT_PATH" | grep -q "^#!"; then
  sed -i '' '1i\
#!/usr/bin/env node
' "$SCRIPT_PATH"
fi

chmod +x "$SCRIPT_PATH"

shell_name=$(basename "$SHELL")
case "$shell_name" in
  bash) SHELL_RC="$HOME/.bashrc" ;;
  zsh) SHELL_RC="$HOME/.zshrc" ;;
  fish) SHELL_RC="$HOME/.config/fish/config.fish" ;;
  *) SHELL_RC="$HOME/.bashrc" ;;
esac

ALIAS_CMD="alias motivate=\"node $SCRIPT_PATH\""

if ! grep -Fxq "$ALIAS_CMD" "$SHELL_RC" 2>/dev/null; then
  echo "$ALIAS_CMD" >> "$SHELL_RC"
  echo "Added alias to $SHELL_RC"
else
  echo "Alias already exists in $SHELL_RC"
fi

echo ""
echo "Installation complete!"
echo "Restart your terminal or run: source $SHELL_RC"
echo "Then you can use 'motivate' command to see a motivational quote."
echo ""
echo "Note for Windows users: Use Git Bash or WSL for best compatibility."
