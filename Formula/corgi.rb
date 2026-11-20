# typed: strict
# frozen_string_literal: true

# Written by corgi's release workflow (scripts/brew-formula.sh in hong-yi/corgi): edits here are replaced
# by the next release.
class Corgi < Formula
  desc "Tmux-style terminal UI for herdr-core"
  homepage "https://github.com/hong-yi/corgi"
  # The Apple Silicon build by default (brew reads the version from its name); Linux overrides it
  # below. Every OS and CPU must have a URL, even the Intel Mac that depends_on then refuses.
  url "https://github.com/hong-yi/corgi/releases/download/v0.1.3/corgi-0.1.3-aarch64-apple-darwin.tar.gz"
  sha256 "5751875542568b4cf89a43574f86ba1467df09e7c303a14de205817a0896870e"
  license "MIT"

  on_macos do
    # Apple Silicon only: there's no Intel Mac build.
    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/hong-yi/corgi/releases/download/v0.1.3/corgi-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63a9c300d31cec8f2d16b8c38a2ea5c3c9a6488e13a0974439765f64a975b354"
    end
    on_arm do
      url "https://github.com/hong-yi/corgi/releases/download/v0.1.3/corgi-0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15dbbe3225ac6f8ee8ca1dcb4872e705db7b314699b7cad5d0f842356b2c4c26"
    end
  end

  def install
    bin.install "corgi"
  end

  def caveats
    <<~EOS
      corgi runs on herdr-core (`hc`). If `hc` isn't installed yet:
        curl -fsSL https://releases.herdr.dev/core/install.sh | sh
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/corgi --version")
  end
end
