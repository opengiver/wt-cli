class WtCli < Formula
  desc "Git worktree management CLI for parallel development"
  homepage "https://github.com/opengiver/wt-cli"
  url "https://github.com/opengiver/wt-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  def install
    bin.install "bin/wt"
    bin.install "bin/wtf"
  end

  test do
    system "#{bin}/wt", "help"
  end
end
