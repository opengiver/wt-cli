#!/bin/bash
# Usage: curl -fsSL https://raw.githubusercontent.com/opengiver/wt-cli/main/install.sh | bash

set -e

REPO="opengiver/wt-cli"
INSTALL_DIR="$HOME/.local/bin"

echo "🚀 Installing wt-cli..."

mkdir -p "$INSTALL_DIR"

curl -fsSL "https://raw.githubusercontent.com/$REPO/main/bin/wt" -o "$INSTALL_DIR/wt"
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/bin/wtf" -o "$INSTALL_DIR/wtf"

chmod +x "$INSTALL_DIR/wt" "$INSTALL_DIR/wtf"

SHELL_INTEGRATION='
# wt-cli (DO NOT EDIT)
wt() {
  if [[ "$1" == "cd" ]] && [[ -n "$2" ]]; then
    local target_dir
    target_dir=$(command wt cd "$2" 2>/dev/null)
    if [[ -n "$target_dir" ]] && [[ -d "$target_dir" ]]; then
      cd "$target_dir"
    else
      command wt cd "$2"
    fi
  else
    command wt "$@"
  fi
}
# wt-cli end'

install_shell_integration() {
  local rc_file="$1"
  
  if [[ -f "$rc_file" ]] && grep -q "wt-cli (DO NOT EDIT)" "$rc_file" 2>/dev/null; then
    echo "  ⏭️  Shell integration already in $rc_file"
    return 0
  fi
  
  echo "$SHELL_INTEGRATION" >> "$rc_file"
  echo "  ✅ Added shell integration to $rc_file"
}

echo ""
echo "📦 Installing shell integration..."

if [[ -n "$ZSH_VERSION" ]] || [[ "$SHELL" == *"zsh"* ]]; then
  install_shell_integration "$HOME/.zshrc"
elif [[ -n "$BASH_VERSION" ]] || [[ "$SHELL" == *"bash"* ]]; then
  install_shell_integration "$HOME/.bashrc"
else
  [[ -f "$HOME/.zshrc" ]] && install_shell_integration "$HOME/.zshrc"
  [[ -f "$HOME/.bashrc" ]] && install_shell_integration "$HOME/.bashrc"
fi

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo ""
  echo "⚠️  $INSTALL_DIR is not in PATH"
  echo "   Add to ~/.zshrc or ~/.bashrc:"
  echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "⚡ Restart terminal or: source ~/.zshrc"
echo ""
echo "Usage:"
echo "  wt ls           List worktrees"
echo "  wt cd <name>    Change to worktree"
echo "  wt help         Show help"
