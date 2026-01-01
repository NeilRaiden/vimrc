# vimrc (in progress)
VIM text editor setup for learning languages.

This repository contains setup files for VIM text editor with the following features:

1. Custom keyboard layout switcher (pop-up window)
2. Selector for spell check dictionaries (pop-up window)
    - _Note: dictionaries not included yet._
3. Pop-up allowing activation of various functionalities

## Prerequisites

* VIM version 9.1
* MacOS: terminal emulator like GhosTTY
    - _note: when "U.S." keyboard layout is selected, GhosTTY redefines Layer 3 & 4 to it's own "layout"._

## Installation

1. Copy the content of this repository to your home directory on a local machine (macOS or Linux).
2. Add `alias vm='vim -u ~/vimrc-vm` to your `.zshrc` or `.bashrc` file
    - _note: this config allows the user to keep `vim` to use their old `.vimrc` file._

## Usage

* Start the alternative `vim` using alias created earlier: `vm`
* use `gx` to launch a web browser and open an http link under the cursor
* use `gy` to launch a web browser and lookup word under the cursor in pre-defined online dictionary (Collins.com)
* Spacebar is configured as the `<leader>` key.
    - `<space>c` - show simple VIM cheat sheet in right split-window.
    - `<space>s` - shows spell-check options.
    - `<space>t` - shows pop-up with various tools.
    - `<space>d` - to show simple pop-up window with the spelling of the word under the cursor (requires "KingsleyReedLexicon" in `~/KRL` directory - not included yet).
    - `<space><space><space>` - shows pop-up window with keyboard layouts to select
    - _note: after activating a "keyboard layout" use `<space>c` to open a right split-window with the corresponding layout for reference._ 
* The time allotted for typing `<leader>+key` shortcuts is set to 500 milliseconds (see: `set timeoutlen=500`).

---

## Description

What problems this projects aims to solve:
* Problem 1: the `vim` editor available in Homebrew is **not** compiled with the `+keymap` option.
* Problem 2: some terminal emulators (GhosTTY) override the keyboard layout from the operating system.  

Solutions:
- Solution to problem 1&2: create keyboard layouts using `inoremap`.

VIM text editor is the best tool for language learning. It allows the user to use multiple spell check dictionaries, including custom made.
This feature allows the user to create and use their own spell check dictionaries, for example:
- list of words the learner already knows — spell check highlights the words user doesn't know yet,
- phonemic transcription dictionary — to type using IPA (or Shavian alphabet) symbols and verify correctness on the fly for **immediate feedback**.

---

