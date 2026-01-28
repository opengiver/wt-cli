# wt-cli

Git worktree management CLI for parallel development.

Prevent branch conflicts when multiple agents/developers work simultaneously on the same project.

## Installation

### npm (Recommended for developers)

```bash
npm install -g @opengiver/wt-cli
```

### Homebrew (macOS)

```bash
brew install opengiver/wt-cli/wt-cli
```

Or with tap:

```bash
brew tap opengiver/wt-cli
brew install wt-cli
```

### curl (One-liner)

```bash
curl -fsSL https://raw.githubusercontent.com/opengiver/wt-cli/main/install.sh | bash
```

### Manual

```bash
curl -fsSL https://raw.githubusercontent.com/opengiver/wt-cli/main/bin/wt -o ~/.local/bin/wt
curl -fsSL https://raw.githubusercontent.com/opengiver/wt-cli/main/bin/wtf -o ~/.local/bin/wtf
chmod +x ~/.local/bin/wt ~/.local/bin/wtf
```

## Commands

### `wt` - Worktree Management

```bash
wt                 # Interactive mode: tmux UI with worktree selector + dev server
wt ls              # List all worktrees and their status
wt cd <name>       # Change to worktree directory
wt ports           # Show port assignments
wt open <name>     # Open worktree in browser
wt dev-all         # Start all dev servers in tmux
wt attach          # Attach to tmux session
wt stop [name]     # Stop dev server(s)
wt link-env [name] # Link .env files from main repo to worktree
wt link-env-all    # Link .env files to all worktrees
wt install [name]  # Install dependencies in worktree
wt install-all     # Install dependencies in all worktrees
wt setup           # Install shell integration (for wt cd)
wt help            # Show help
```

**Interactive Mode** (`wt` with no args):
- Top pane: Worktree selector with port status
- Bottom pane: Dev server output
- `↑/↓` to navigate, `Enter` to start, `Tab` to switch panes, `q` to quit

### `wtf` - Worktree Flutter Switcher

Interactive Flutter debugging with easy worktree switching.

```bash
wtf                # Start interactive mode
wtf "iPhone 15"    # Start with specific device
```

**Two modes:**

1. **tmux mode** (when tmux is installed):
   - Split view: top pane shows worktree list, bottom pane runs Flutter
   - Switch worktrees while Flutter is running (no need to quit!)
   - Worktree list auto-updates

2. **Classic mode** (fallback when no tmux):
   - Traditional menu-based selection
   - Press `q` in Flutter to return to selection

**Controls:**
- `↑`/`↓` - Navigate worktree list
- `Enter` - Select and run Flutter
- `1-9` - Jump directly to worktree
- `q` - Quit
- In Flutter: `r` (hot reload), `R` (hot restart), `q` (quit flutter)

## Example Workflow

```bash
# 1. Create worktrees for parallel work
git worktree add -b feature/auth ../my-app-worktrees/feature-auth main
git worktree add -b feature/ui ../my-app-worktrees/feature-ui main

# 2. Link .env files (required for builds)
wt link-env-all

# 3. Install dependencies in all worktrees
wt install-all

# 4. Check status
wt ls

# 5. Start all dev servers
wt dev-all

# 6. Switch between worktrees in tmux
wt attach
# Ctrl+b, n  → next worktree
# Ctrl+b, p  → previous worktree

# 7. For Flutter projects
wtf
# Select worktree by number, flutter run starts automatically
```

## Features

- **Auto-detect project type**: Flutter, Node.js, Go, Rust, Python
- **Subdirectory support**: Finds `pubspec.yaml` or `package.json` in `app/`, `src/`, etc.
- **Port auto-assignment**: Each worktree gets unique port (3000, 3001, ...)
- **tmux integration**: Manage all dev servers in one session
- **Flutter switcher**: Quick switching between worktrees on single device
- **Env file linking**: Symlink `.env`, `.env.*`, secrets from main repo to worktrees

## Requirements

- Git
- Bash
- tmux (optional, for `wt dev-all` and `wtf` split view)
- Flutter (for `wtf`)

## License

MIT
