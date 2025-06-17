# 💡 Terminal Motivation

Get motivation quotes right in your terminal by just typing `motivate`. You will get a random inspirational quote that keeps you focused and energized throughout the day. Simple and fast for a quick boost.

![Terminal Motivation Header](https://raw.githubusercontent.com/mesamirh/Terminal-Motivation/main/assets/header.png)

---

## ✨ Features

- Shows a random motivational quote in your terminal
- Lightweight and fast
- Works offline once installed
- Easily extendable with your own quotes

---

## 🚀 Installation (One-Liner)

> ✅ Works on macOS & Linux  
> ⚠️ Windows users: use Git Bash or WSL

Just paste this into your terminal:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mesamirh/Terminal-Motivation/main/install.sh)"
```

## 📦 Usage

```bash
motivate
```

You’ll see a random quote like:

> "Push yourself, because no one else is going to do it for you."

## 🗑️ Delete

```bash
rm -rf ~/.terminal-motivation && sed -i.bak '/alias motivate=/d' ~/.bashrc ~/.zshrc ~/.config/fish/config.fish 2>/dev/null
```

## 🧠 How It Works

- Quotes are stored in data/quotes.json
- Script uses Node.js to read and print a random one
