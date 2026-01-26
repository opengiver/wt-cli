class WtCli < Formula
  desc "Git worktree management CLI for parallel development"
  homepage "https://github.com/lbo728/wt-cli"
  url "https://github.com/lbo728/wt-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ff7359da2a3e17b3543744fd200dc7eb1800882c8acd617cc9f4611f9b8c4adb"
  license "MIT"

  def install
    bin.install "bin/wt"
    bin.install "bin/wtf"
  end

  test do
    system "#{bin}/wt", "help"
  end
end
