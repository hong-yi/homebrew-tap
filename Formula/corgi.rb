# typed: strict
# frozen_string_literal: true

# Written by corgi's release workflow (scripts/brew-formula.sh in hong-yi/corgi): edits here are replaced
# by the next release.
class Corgi < Formula
  desc "Tmux-style terminal UI for herdr-core"
  homepage "https://github.com/hong-yi/corgi"
  # The Apple Silicon build by default (brew reads the version from its name); Linux overrides it
  # below. Every OS and CPU must have a URL, even the Intel Mac that depends_on then refuses.
  url "https://github.com/hong-yi/corgi/releases/download/v0.1.1/corgi-0.1.1-aarch64-apple-darwin.tar.gz"
  sha256 "bc35fadfa69b1ffecc6199472800f74347c8589b4dd8eb41e5cf098925ffbc61"
  license "MIT"

  on_macos do
    # Apple Silicon only: there's no Intel Mac build.
    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/hong-yi/corgi/releases/download/v0.1.1/corgi-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "654f9b6549b512135f36a74fba334c0856e33cb9b2ecf2434be80ae2bf5a838e"
    end
    on_arm do
      url "https://github.com/hong-yi/corgi/releases/download/v0.1.1/corgi-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c55ade4485783abe8091e057544ea76a8b2ca3f7d31fc620b6a7fbc228837c4e"
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
