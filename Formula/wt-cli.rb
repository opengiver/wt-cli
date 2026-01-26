class WtCli < Formula
  desc "Git worktree management CLI for parallel development"
  homepage "https://github.com/lbo728/wt-cli"
  url "https://github.com/lbo728/wt-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"

  def install
    bin.install "bin/wt"
    bin.install "bin/wtf"
  end

  test do
    system "#{bin}/wt", "help"
  end
end
