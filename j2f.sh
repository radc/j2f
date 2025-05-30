# ~/.j2f.sh

j2f() {
    local DB_FILE="$HOME/.j2f/shortcuts.db"
    mkdir -p "$HOME/.j2f"
    touch "$DB_FILE"

    local cmd="$1"
    shift

    case "$cmd" in
        add)
            local name="$1"
            local path="${2:-$PWD}"
            if [ -z "$name" ]; then
                echo "Usage: j2f add <name> [path]"
                return 1
            fi
            grep -v "^$name|" "$DB_FILE" > "$DB_FILE.tmp" && mv "$DB_FILE.tmp" "$DB_FILE"
            echo "$name|$path" >> "$DB_FILE"
            echo "[✔] Shortcut '$name' added -> $path"
            ;;
        go)
            local name="$1"
            if [ -z "$name" ]; then
                echo "Usage: j2f go <name>"
                return 1
            fi
            local path
            path=$(grep "^$name|" "$DB_FILE" | cut -d'|' -f2-)
            if [ -z "$path" ]; then
                echo "[!] Shortcut '$name' not found"
                return 1
            fi
            cd "$path" || return 1
            ;;
        list)
            echo "📁 Saved shortcuts:"
            awk -F'|' '{printf "• %s → %s\n", $1, $2}' "$DB_FILE"
            ;;
        remove)
            local name="$1"
            if [ -z "$name" ]; then
                echo "Usage: j2f remove <name>"
                return 1
            fi
            grep -v "^$name|" "$DB_FILE" > "$DB_FILE.tmp" && mv "$DB_FILE.tmp" "$DB_FILE"
            echo "[✔] Shortcut '$name' removed."
            ;;
        *)
            echo "Usage:"
            echo "  j2f add <name> [path]   Add shortcut to path (default: current dir)"
            echo "  j2f go <name>           Change directory to saved shortcut"
            echo "  j2f list                List saved shortcuts"
            echo "  j2f remove <name>       Remove a shortcut"
            ;;
    esac
}
