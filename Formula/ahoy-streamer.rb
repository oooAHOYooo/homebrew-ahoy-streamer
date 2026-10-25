class AhoyStreamer < Formula
  desc "Keyboard-first terminal for discovering and playing AHOY Streamer media"
  homepage "https://github.com/oooAHOYooo/ahoy-streamer-cli"
  version "0.1.0-standalone-preview.2"
  license :cannot_represent

  depends_on macos: :ventura

  if Hardware::CPU.arm?
    url "https://github.com/oooAHOYooo/ahoy-streamer-cli/releases/download/v0.1.0-standalone-preview.2/ahoy-streamer-macos-apple-silicon-preview.zip"
    sha256 "230914dabd85cd35af1d4b0288b7676d18c999c07db3491bdd8f6193d63a0d77"
  else
    url "https://github.com/oooAHOYooo/ahoy-streamer-cli/releases/download/v0.1.0-standalone-preview.2/ahoy-streamer-macos-intel-preview.zip"
    sha256 "d2989c4ec8605b07913ff13d97a706a57817a012b36e3af69028cb4aade8d74f"
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
