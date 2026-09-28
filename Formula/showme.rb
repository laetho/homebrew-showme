class Showme < Formula
  desc "Share local web services, files, and directories at a temporary URL"
  homepage "https://github.com/laetho/homebrew-showme"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.3.0/showme_v0.3.0_darwin_arm64.tar.gz"
      sha256 "4966aa9e5ee2a18ee46c10a24284dfad33d55a10ea130d2cfd2f7669f3d32adc"
    else
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.3.0/showme_v0.3.0_darwin_amd64.tar.gz"
      sha256 "587c866cc8c34ffc483a10d71d5be0e3779025fe7d2ef4efeb50fc32f631f3af"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.3.0/showme_v0.3.0_linux_arm64.tar.gz"
      sha256 "426250c3ec6aa3a3b95f7f685ade70d286744d32081de1cceeabbec6604efe96"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.3.0/showme_v0.3.0_linux_amd64.tar.gz"
      sha256 "a018ebea37c556b19c4c1a994d5698ed53d07a342cca04b1e50f488b32eadd2e"
    end
  end

  def install
    bin.install Dir["showme_*"][0] => "showme"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/showme -help 2>&1")
  end
end
