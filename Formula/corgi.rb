# typed: strict
# frozen_string_literal: true

# Written by corgi's release workflow (scripts/brew-formula.sh in hong-yi/corgi): edits here are replaced
# by the next release.
class Corgi < Formula
  desc "Tmux-style terminal UI for herdr-core"
  homepage "https://github.com/hong-yi/corgi"
  # The Apple Silicon build by default (brew reads the version from its name); Linux overrides it
  # below. Every OS and CPU must have a URL, even the Intel Mac that depends_on then refuses.
  url "https://github.com/hong-yi/corgi/releases/download/v0.1.2/corgi-0.1.2-aarch64-apple-darwin.tar.gz"
  sha256 "00594e8b90f0133633845f10610136235694a96f2159bcb1b86b018f962b2dcd"
  license "MIT"

  on_macos do
    # Apple Silicon only: there's no Intel Mac build.
    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/hong-yi/corgi/releases/download/v0.1.2/corgi-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5fad6f3929d07052103e342c186871b33eb2eb6dd265a472fd24929666d1d11"
    end
    on_arm do
      url "https://github.com/hong-yi/corgi/releases/download/v0.1.2/corgi-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b9335dd4a67832023501d076251a605bc223a2beb4d60ebfcd218264f15c298"
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
