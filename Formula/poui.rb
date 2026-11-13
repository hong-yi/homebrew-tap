class Poui < Formula
  desc "Application to help you open your relevant developer portals"
  homepage "https://github.com/hong-yi/poui"
  url "https://github.com/hong-yi/poui.git",
      tag:      "v0.2.2",
      revision: "58b9d62ded5cddccc25c7f235d65918ab3803a56"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "true"
  end
end
