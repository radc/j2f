# 🏃 j2f - Jump to Folder (Shell Version)

**j2f** is a shell-native shortcut system to quickly jump to directories using aliases in your terminal.

## 🔧 Installation

```bash
./install
source ~/.j2f.sh
```

This adds the `j2f` function to your `.bashrc` or `.zshrc`.

## ✅ Usage

```bash
j2f add myproj              # Save current directory as 'myproj'
j2f add docs ~/Documents    # Save a custom path as 'docs'
j2f go myproj               # cd to that folder
j2f list                    # Show all shortcuts
j2f remove docs             # Remove a shortcut
```

## 🗃️ Shortcuts are saved at

```text
~/.j2f/shortcuts.db
```

Each line follows the format:
```
name|/full/path/to/directory
```

## 📄 License

MIT
