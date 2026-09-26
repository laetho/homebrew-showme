class Showme < Formula
  desc "Share local web services, files, and directories at a temporary URL"
  homepage "https://github.com/laetho/homebrew-showme"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.3/showme_v0.2.3_darwin_arm64.tar.gz"
      sha256 "278f18a5dd81fb2f760b4cc9281047555b212f228a70ba3d021db98f6fe64299"
    else
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.3/showme_v0.2.3_darwin_amd64.tar.gz"
      sha256 "32b89fb9dc1c642a9c6d7778a8774969591b462d62a15f56d03166df91512032"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.3/showme_v0.2.3_linux_arm64.tar.gz"
      sha256 "ba1860194a645385607ff63ba6be1ceedd6b527e352f9120c0dc7a3dcca8c77e"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.3/showme_v0.2.3_linux_amd64.tar.gz"
      sha256 "d8729dcaf96373fea2b2c705ba7dc4cfd90f47e57e9ac03c02a0de6b1af78575"
    end
  end

  def install
    bin.install Dir["showme_*"][0] => "showme"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/showme -help 2>&1")
  end
end
