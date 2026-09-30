class Showme < Formula
  desc "Share local web services, files, and directories at a temporary URL"
  homepage "https://github.com/laetho/homebrew-showme"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.4.0/showme_v0.4.0_darwin_arm64.tar.gz"
      sha256 "260987257f3c5d66dee814c6ed17ea5dfba799c7321922e963974bb8bee3c92c"
    else
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.4.0/showme_v0.4.0_darwin_amd64.tar.gz"
      sha256 "51f68cae4c529c39883e4ff0cec58084c8a58433b0803551c9095c1dc07fb4a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.4.0/showme_v0.4.0_linux_arm64.tar.gz"
      sha256 "d8281f59274c29283be20b6a30a7930f540fb3363dbd05ecb42826bf0afa4e83"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.4.0/showme_v0.4.0_linux_amd64.tar.gz"
      sha256 "c5b6ec087f2a7af1e32df063fc12b303ad88b2e7925252badff33a773ab36131"
    end
  end

  def install
    bin.install Dir["showme_*"][0] => "showme"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/showme -help 2>&1")
  end
end
