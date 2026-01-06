class Proxmux < Formula
  desc "Terminal UI for managing Proxmox VE clusters"
  homepage "https://github.com/roshie548/proxmux"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/roshie548/proxmux/releases/download/v0.4.0/proxmux-darwin-arm64"
      sha256 "3ae562631957950f3da1e44645f303c4956b7aedd1d21d29bd98085468143a28"
    else
      url "https://github.com/roshie548/proxmux/releases/download/v0.4.0/proxmux-darwin-x64"
      sha256 "832608904d34b64897f9726d9db63baaacd2282fe62ca51c99b3f88b41d23b40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/roshie548/proxmux/releases/download/v0.4.0/proxmux-linux-arm64"
      sha256 "c15636dcd87fefe222a7239a61e1373b793a703193b4edc49df45239076339b4"
    else
      url "https://github.com/roshie548/proxmux/releases/download/v0.4.0/proxmux-linux-x64"
      sha256 "45eac7b4b5be3797fd5eff53951daa966ef20598dc8c864e03aa3ce2ccc75f56"
    end
  end

  def install
    bin.install stable.url.split("/").last => "proxmux"
  end

  test do
    assert_match "proxmux", shell_output("#{bin}/proxmux --help 2>&1", 1)
  end
end
