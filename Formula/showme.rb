class Showme < Formula
  desc "Share local web services, files, and directories at a temporary URL"
  homepage "https://github.com/laetho/homebrew-showme"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.5.0/showme_v0.5.0_darwin_arm64.tar.gz"
      sha256 "cc87c97b36c497c0841cff7ae2c32b9a0ed2fcb7947de1e73b4a75505456c2c7"
    else
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.5.0/showme_v0.5.0_darwin_amd64.tar.gz"
      sha256 "ce98fd39f2bb02458c7047759d428559362b1861c0226a04350572d3bc905aad"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.5.0/showme_v0.5.0_linux_arm64.tar.gz"
      sha256 "435fc5ac846eaa6d5ea3ad5f4a58c3e80c3aab9b6a1785e04798d960d2e0b72e"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.5.0/showme_v0.5.0_linux_amd64.tar.gz"
      sha256 "542cb70dc91ca787e3bda424df211fa7e6641978e804ddcbd9166a24c53f83d0"
    end
  end

  def install
    bin.install Dir["showme_*"][0] => "showme"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/showme -help 2>&1")
  end
end
