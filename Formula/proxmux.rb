class Proxmux < Formula
  desc "Terminal UI for managing Proxmox VE clusters"
  homepage "https://github.com/roshie548/proxmux"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/roshie548/proxmux/releases/download/v0.2.2/proxmux-darwin-arm64"
      sha256 "6bdf0409a42e78cdbfc3e04f9a7ad19c60e9bed6b2e9395ee475306de12cde5b"
    else
      url "https://github.com/roshie548/proxmux/releases/download/v0.2.2/proxmux-darwin-x64"
      sha256 "d744ebf09840e4df03e53fdb9142e2bcebed985e86ec7c0e9cf1ecdcf7e7706c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/roshie548/proxmux/releases/download/v0.2.2/proxmux-linux-arm64"
      sha256 "d38c5a7a05956195fd1490d94e52350ba417920adfaa476bd0e6f539892e5fd1"
    else
      url "https://github.com/roshie548/proxmux/releases/download/v0.2.2/proxmux-linux-x64"
      sha256 "839f873d89a9a437fad17d73b7f45ade8266e1dcbb1b66ab986bfdde5f6dd94c"
    end
  end

  def install
    bin.install stable.url.split("/").last => "proxmux"
  end

  test do
    assert_match "proxmux", shell_output("#{bin}/proxmux --help 2>&1", 1)
  end
end
