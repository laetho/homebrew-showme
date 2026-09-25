class Showme < Formula
  desc "Share local web services, files, and directories at a temporary URL"
  homepage "https://github.com/laetho/homebrew-showme"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.1.1/showme_v0.1.1_darwin_arm64.tar.gz"
      sha256 "2981f8a022843cb29fefe359127d6c9f1e8958418636c506fbb43578a1c8f677"
    else
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.1.1/showme_v0.1.1_darwin_amd64.tar.gz"
      sha256 "ab2a41c4c50ae2af93c7e69d4275c8d4581b8795f8ff43c6432e090ee9cc196f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.1.1/showme_v0.1.1_linux_arm64.tar.gz"
      sha256 "179b5ec12254dc6d12f871b8402e450bc74c1a50c0934806124a3520a51e2d99"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.1.1/showme_v0.1.1_linux_amd64.tar.gz"
      sha256 "69cd153a0f297f3d6019a8c2dfd0e1306812c7595c749bd20916e187bbeb00b9"
    end
  end

  def install
    bin.install Dir["showme_*"][0] => "showme"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/showme -help 2>&1")
  end
end
