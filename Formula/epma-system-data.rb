class EpmaSystemData < Formula
  desc "Native macOS app to measure and clean System Data"
  homepage "https://github.com/1985epma/epma-system-data"
  url "https://github.com/1985epma/epma-system-data/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6c88539ff8a68c6eb33b9bf1b79f8666ba5edb86536214073c7399cbf856cac5"
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
