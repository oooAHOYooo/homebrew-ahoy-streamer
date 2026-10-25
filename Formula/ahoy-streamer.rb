class AhoyStreamer < Formula
  desc "Keyboard-first terminal for discovering and playing AHOY Streamer media"
  homepage "https://github.com/oooAHOYooo/ahoy-streamer-cli"
  version "0.1.0-standalone-preview.3"
  license :cannot_represent

  depends_on macos: :ventura

  if Hardware::CPU.arm?
    url "https://github.com/oooAHOYooo/ahoy-streamer-cli/releases/download/v0.1.0-standalone-preview.3/ahoy-streamer-macos-apple-silicon-preview.zip"
    sha256 "05186bfcb5624789ff78b149893f9560055afabd81e36c9b8fcf8ac82620c229"
  else
    url "https://github.com/oooAHOYooo/ahoy-streamer-cli/releases/download/v0.1.0-standalone-preview.3/ahoy-streamer-macos-intel-preview.zip"
    sha256 "8441909618779a21de8235d8f323b1a6936a202161c6f179b1fc99dd50d3dc54"
  end

  def install
    bin.install "ahoy-streamer"
  end

  def caveats
    <<~EOS
      This is a preview build from the AHOY Streamer project tap.
      The macOS executable is not signed or notarized by Apple.
      This third-party tap is not maintained or endorsed by Homebrew.
    EOS
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/ahoy-streamer --version")
  end
end
