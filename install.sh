#!/bin/bash

INSTALL_DIR="$HOME/.terminal-motivation"

echo "📦 Installing Terminal Motivation..."

if [ -d "$INSTALL_DIR" ]; then
  echo "🔄 Updating existing install..."
  git -C "$INSTALL_DIR" pull
else
  git clone https://github.com/mesamirh/Terminal-Motivation.git "$INSTALL_DIR"
fi

cd "$INSTALL_DIR" || exit 1
echo "📦 Installing Node.js packages..."
npm install --silent

SHELL_NAME=$(basename "$SHELL")
ALIAS_CMD="alias motivate='node $INSTALL_DIR/index.js'"

if [[ "$SHELL_NAME" == "zsh" ]]; then
  SHELL_RC="$HOME/.zshrc"
elif [[ "$SHELL_NAME" == "bash" ]]; then
  SHELL_RC="$HOME/.bashrc"
elif [[ "$SHELL_NAME" == "fish" ]]; then
  SHELL_RC="$HOME/.config/fish/config.fish"
  ALIAS_CMD="alias motivate 'node $INSTALL_DIR/index.js'"
else
  echo "⚠️ Unsupported shell: $SHELL_NAME. Please add the alias manually."
  exit 1
fi

if ! grep -q "motivate=" "$SHELL_RC"; then
  echo "$ALIAS_CMD" >> "$SHELL_RC"
  echo "✅ Alias added to $SHELL_RC"
else
  echo "ℹ️ Alias already exists in $SHELL_RC"
fi

echo "♻️ Reloading your shell..."
source "$SHELL_RC"

echo "🎉 Done! Type 'motivate' in your terminal to get inspired!"
