class EpmaSystemData < Formula
  desc "Native macOS app to measure and clean System Data"
  homepage "https://github.com/1985epma/epma-system-data"
  url "https://github.com/1985epma/epma-system-data/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "894003a16a6a0d9c6a0c23dc1a4965a60fe7a84580b6055c23ca74cf0d3aea9f"
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
