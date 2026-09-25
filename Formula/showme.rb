class Showme < Formula
  desc "Share local web services, files, and directories at a temporary URL"
  homepage "https://github.com/laetho/homebrew-showme"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.2/showme_v0.2.2_darwin_arm64.tar.gz"
      sha256 "65039d705d40345eab5681bebe9e4d3920ee5adae4ec38d98a5f775ef658af2b"
    else
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.2/showme_v0.2.2_darwin_amd64.tar.gz"
      sha256 "0aed5a3dab9c052a5e0f83ee8f63b2819831fee84792059614e7aecfead41ba3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.2/showme_v0.2.2_linux_arm64.tar.gz"
      sha256 "edc2f85c31c2bbc9df4e1f767925202522e83cc07faa215c46b58d6a671ceb14"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.2/showme_v0.2.2_linux_amd64.tar.gz"
      sha256 "ea5508a9f04efe73219221b86c7a721a9e4ba4090058da9895d986b670ea3dfb"
    end
  end

  def install
    bin.install Dir["showme_*"][0] => "showme"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/showme -help 2>&1")
  end
end
