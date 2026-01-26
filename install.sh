#!/bin/bash
# wt-cli installer
# Usage: curl -fsSL https://raw.githubusercontent.com/lbo728/wt-cli/main/install.sh | bash

set -e

REPO="lbo728/wt-cli"
INSTALL_DIR="$HOME/.local/bin"

echo "🚀 Installing wt-cli..."

# Create install directory
mkdir -p "$INSTALL_DIR"

# Download scripts
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/bin/wt" -o "$INSTALL_DIR/wt"
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/bin/wtf" -o "$INSTALL_DIR/wtf"

# Make executable
chmod +x "$INSTALL_DIR/wt" "$INSTALL_DIR/wtf"

# Check PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo ""
  echo "⚠️  $INSTALL_DIR is not in PATH"
  echo ""
  echo "Add this to your ~/.zshrc or ~/.bashrc:"
  echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
  echo ""
  echo "Then restart your terminal or run:"
  echo "  source ~/.zshrc"
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "Usage:"
echo "  wt ls        List worktrees"
echo "  wt help      Show help"
echo "  wtf          Flutter worktree switcher"
