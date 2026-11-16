# typed: strict
# frozen_string_literal: true

# Written by corgi's release workflow (scripts/brew-formula.sh in hong-yi/corgi): edits here are replaced
# by the next release.
class Corgi < Formula
  desc "Tmux-style terminal UI for herdr-core"
  homepage "https://github.com/hong-yi/corgi"
  version "0.1.0"
  license "MIT"

  on_macos do
    # Apple Silicon only: there's no Intel Mac build.
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/hong-yi/corgi/releases/download/v0.1.0/corgi-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "1e3cbb8ab4af36433f4dbff19e5072a763dab3e584bd5cf3e9139c36323c6506"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hong-yi/corgi/releases/download/v0.1.0/corgi-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b2c01d60980599788673902eeb21cd1fbeaac20f1b116598c68466851a81fa4"
    end
    on_arm do
      url "https://github.com/hong-yi/corgi/releases/download/v0.1.0/corgi-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2311664297e671d96e001fe4068cc3a63a2e82de8222b94012f76139f3fb0a8d"
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
