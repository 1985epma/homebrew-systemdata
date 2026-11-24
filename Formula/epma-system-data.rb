class EpmaSystemData < Formula
  desc "Native macOS app to measure and clean System Data"
  homepage "https://github.com/1985epma/epma-system-data"
  url "https://github.com/1985epma/epma-system-data/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "aad48cd0e99c917dde16d3b7a1700b53cc04e7a1f4c60a0ac4b6556a6e94c6b2"
  license "MIT"
  head "https://github.com/1985epma/epma-system-data.git", branch: "master"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Caches de apps", shell_output("#{bin}/epma-system-data --scan")
  end
end
