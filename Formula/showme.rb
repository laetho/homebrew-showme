class Showme < Formula
  desc "Share local web services, files, and directories at a temporary URL"
  homepage "https://github.com/laetho/homebrew-showme"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.4/showme_v0.2.4_darwin_arm64.tar.gz"
      sha256 "dabe7b7e909125d398e23ada5c4b50943577d2ed99b6cc69ac9f0696b4f9ac1e"
    else
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.4/showme_v0.2.4_darwin_amd64.tar.gz"
      sha256 "13e9e4ec8c3df806e0a4741ef926e1f6f06d29cdcc18ca92dc46a5a27746e7d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.4/showme_v0.2.4_linux_arm64.tar.gz"
      sha256 "2eca3016c9f97b1c0d9ea214f20dd4ad5b52f84c6090d72a55e4985f869db880"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.4/showme_v0.2.4_linux_amd64.tar.gz"
      sha256 "bbcc461fd71d8b2f5842e92594acb150d861219c427f08dd73ca3df76db96558"
    end
  end

  def install
    bin.install Dir["showme_*"][0] => "showme"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/showme -help 2>&1")
  end
end
