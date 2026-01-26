# wt-cli

Git worktree management CLI for parallel development.

Prevent branch conflicts when multiple agents/developers work simultaneously on the same project.

## Installation

### npm (Recommended for developers)

```bash
npm install -g wt-cli
```

### Homebrew (macOS)

```bash
brew install lbo728/wt-cli/wt-cli
```

Or with tap:

```bash
brew tap lbo728/wt-cli
brew install wt-cli
```

### curl (One-liner)

```bash
curl -fsSL https://raw.githubusercontent.com/lbo728/wt-cli/main/install.sh | bash
```

### Manual

```bash
curl -fsSL https://raw.githubusercontent.com/lbo728/wt-cli/main/bin/wt -o ~/.local/bin/wt
curl -fsSL https://raw.githubusercontent.com/lbo728/wt-cli/main/bin/wtf -o ~/.local/bin/wtf
chmod +x ~/.local/bin/wt ~/.local/bin/wtf
```

## Commands

### `wt` - Worktree Management

```bash
wt ls              # List all worktrees and their status
wt cd <name>       # Print path to worktree (use: cd $(wt cd <name>))
wt ports           # Show port assignments
wt open <name>     # Open worktree in browser
wt dev-all         # Start all dev servers in tmux
wt attach          # Attach to tmux session
wt stop [name]     # Stop dev server(s)
wt help            # Show help
```

### `wtf` - Worktree Flutter Switcher

Interactive Flutter debugging with easy worktree switching.

```bash
wtf                # Start interactive mode
wtf "iPhone 15"    # Start with specific device
```

**Inside wtf:**
- Press `1-9` to switch worktree
- Press `q` to quit flutter and return to selection
- Standard flutter keys: `r` (hot reload), `R` (hot restart)

## Example Workflow

```bash
# 1. Create worktrees for parallel work
git worktree add -b feature/auth ../my-app-worktrees/feature-auth main
git worktree add -b feature/ui ../my-app-worktrees/feature-ui main

# 2. Check status
wt ls

# 3. Start all dev servers
wt dev-all

# 4. Switch between worktrees in tmux
wt attach
# Ctrl+b, n  → next worktree
# Ctrl+b, p  → previous worktree

# 5. For Flutter projects
wtf
# Select worktree by number, flutter run starts automatically
```

## Features

- **Auto-detect project type**: Flutter, Node.js, Go, Rust, Python
- **Subdirectory support**: Finds `pubspec.yaml` or `package.json` in `app/`, `src/`, etc.
- **Port auto-assignment**: Each worktree gets unique port (3000, 3001, ...)
- **tmux integration**: Manage all dev servers in one session
- **Flutter switcher**: Quick switching between worktrees on single device

## Requirements

- Git
- Bash
- tmux (optional, for `wt dev-all`)
- Flutter (for `wtf`)

## License

MIT
