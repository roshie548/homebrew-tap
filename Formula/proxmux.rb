class Proxmux < Formula
  desc "Terminal UI for managing Proxmox VE clusters"
  homepage "https://github.com/roshie548/proxmux"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/roshie548/proxmux/releases/download/v0.3.0/proxmux-darwin-arm64"
      sha256 "63e61ad0d98708563b85e3f6976ccbf062083f2015f011a0401964e043c61676"
    else
      url "https://github.com/roshie548/proxmux/releases/download/v0.3.0/proxmux-darwin-x64"
      sha256 "6923672f0a0100d18c4ae644e01afccd1a6573a5d28ad1f1ddaee92c82d761b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/roshie548/proxmux/releases/download/v0.3.0/proxmux-linux-arm64"
      sha256 "630ade59b24f8a21b312070bfc00ec416b67a0460278e315016ac9c7466d1df2"
    else
      url "https://github.com/roshie548/proxmux/releases/download/v0.3.0/proxmux-linux-x64"
      sha256 "78ca6ec0278de05901218b0015583fa78ac0caa77b30eb797e7b48cc7922197b"
    end
  end

  def install
    bin.install stable.url.split("/").last => "proxmux"
  end

  test do
    assert_match "proxmux", shell_output("#{bin}/proxmux --help 2>&1", 1)
  end
end
