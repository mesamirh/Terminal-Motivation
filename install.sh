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

if command -v npm >/dev/null 2>&1; then
  echo "📦 Installing Node.js packages..."
  npm install --silent
else
  echo "❌ npm is not installed. Please install Node.js and try again."
  exit 1
fi

SHELL_NAME=$(basename "$SHELL")
if [[ "$SHELL_NAME" == "zsh" ]]; then
  SHELL_RC="$HOME/.zshrc"
elif [[ "$SHELL_NAME" == "bash" ]]; then
  SHELL_RC="$HOME/.bashrc"
else
  SHELL_RC="$HOME/.profile"
fi

ALIAS_CMD="alias motivate='node $INSTALL_DIR/index.js'"
if ! grep -q "alias motivate=" "$SHELL_RC"; then
  echo "$ALIAS_CMD" >> "$SHELL_RC"
  echo "✅ Alias added to $SHELL_RC"
else
  echo "ℹ️ Alias already exists in $SHELL_RC"
fi

source "$SHELL_RC"

echo "🎉 Done! Type 'motivate' in your terminal to get inspired!"
