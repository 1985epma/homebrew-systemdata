class EpmaSystemData < Formula
  desc "Native macOS app to measure and clean System Data"
  homepage "https://github.com/1985epma/epma-system-data"
  url "https://github.com/1985epma/epma-system-data/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "221f4169043db3ea1f56e5686c8ededd9a4ce85599ec7114944925e55df233aa"
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
