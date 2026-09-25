class Showme < Formula
  desc "Share local web services, files, and directories at a temporary URL"
  homepage "https://github.com/laetho/homebrew-showme"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.1/showme_v0.2.1_darwin_arm64.tar.gz"
      sha256 "a2ddff42872c200f6101e03c610d4e482600998b238c1d7ea9e9e1f2d4b9df1c"
    else
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.1/showme_v0.2.1_darwin_amd64.tar.gz"
      sha256 "9b2a5547acc28da66377a99222f93d11fe18a914ac5c34b8d0f494a6bd45cb17"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.1/showme_v0.2.1_linux_arm64.tar.gz"
      sha256 "f0b80ee83d9c212e80741ddaca05e8e0d6d0b822998ba23ebd5a30e560226cb2"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/laetho/homebrew-showme/releases/download/v0.2.1/showme_v0.2.1_linux_amd64.tar.gz"
      sha256 "8d6475ee8e0def03092f2b15bfd7815e91867df3f65a343514c2788d2ee7f956"
    end
  end

  def install
    bin.install Dir["showme_*"][0] => "showme"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/showme -help 2>&1")
  end
end
