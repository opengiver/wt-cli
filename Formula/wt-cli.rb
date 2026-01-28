class WtCli < Formula
  desc "Git worktree management CLI for parallel development"
  homepage "https://github.com/opengiver/wt-cli"
  url "https://github.com/opengiver/wt-cli/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "aee74b45debebc5ef34affbbd508641d748f3d3a23a97549400aeb5428ef5562"
  license "MIT"

  def install
    bin.install "bin/wt"
    bin.install "bin/wtf"
  end

  test do
    system "#{bin}/wt", "help"
  end
end
