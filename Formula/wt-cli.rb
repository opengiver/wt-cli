class WtCli < Formula
  desc "Git worktree management CLI for parallel development"
  homepage "https://github.com/opengiver/wt-cli"
  url "https://github.com/opengiver/wt-cli/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "fec9b12a9d37caa2457f643382e6e3edc0673ecfdffe027ce21f85824d69d0dd"
  license "MIT"

  def install
    bin.install "bin/wt"
    bin.install "bin/wtf"
  end

  test do
    system "#{bin}/wt", "help"
  end
end
