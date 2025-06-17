#!/usr/bin/env node

const chalk = require("chalk");
const fs = require("fs");
const path = require("path");

// Terminal old massages clear
process.stdout.write("\x1Bc");

// Quotes load

const filePath = path.join(__dirname, "data", "quotes.json");
const quotes = JSON.parse(fs.readFileSync(filePath, "utf-8"));

// Random quote

const pickRandom = (arr) => arr[Math.floor(Math.random() * arr.length)];
const quote = pickRandom(quotes);

// Printing

console.log("\n" + chalk.greenBright(quote) + "\n");
