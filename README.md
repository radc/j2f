# 🏃 j2f — Jump to Folder (Shell-native Directory Shortcuts)

**j2f** (*Jump to Folder*) is a lightweight shell function that lets you quickly navigate to frequently used directories using shortcut names — right from your terminal.

No dependencies. No wrappers. Just native shell power that actually runs `cd` in your terminal session.

---

## 🔧 Installation

```bash
git clone https://github.com/radc/j2f.git
cd j2f
./install
source ~/.j2f.sh
```

This adds the `j2f` function to your shell (`.bashrc` or `.zshrc`).

---

## ✅ Usage

```bash
j2f <shortcut>            # Jump to the folder associated with the shortcut
j2f add <name> [path]     # Save a shortcut for the current or specified directory
j2f list                  # List all saved shortcuts
j2f remove <name>         # Delete a saved shortcut
```

### 💡 Examples

```bash
cd ~/Projects
j2f add proj              # Adds shortcut "proj" for current dir

j2f proj                  # cd into ~/Projects

j2f list                  # Shows saved shortcuts
j2f remove proj           # Deletes the "proj" shortcut
```

---

## 🗃️ Where are shortcuts stored?

Your shortcuts are stored in:

```text
~/.j2f/shortcuts.db
```

Each line follows the format:
```text
name|/full/path/to/folder
```

---

## 🧼 Uninstall

To remove `j2f`, delete the following:

```bash
rm ~/.j2f.sh
rm -rf ~/.j2f
```

And remove the line `source ~/.j2f.sh` from your `.bashrc` or `.zshrc`.

---

## 📄 License

MIT
