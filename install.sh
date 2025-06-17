#!/bin/bash

echo "🚀 Installing Terminal Motivation..."

# Check for node
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install it first: https://nodejs.org"
    exit 1
fi

# Clone the repo
git clone https://github.com/mesamirh/Terminal-Motivation.git ~/.terminal-motivation

cd ~/.terminal-motivation || exit

npm install
npm link

echo "✅ Done! You can now type 'motivate' in your terminal to get inspired."