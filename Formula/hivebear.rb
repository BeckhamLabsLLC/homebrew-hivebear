class Hivebear < Formula
  desc "AI that fits your machine — run LLMs on any device regardless of GPU"
  homepage "https://hivebear.com"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BeckhamLabsLLC/HiveBear/releases/download/v#{version}/hivebear-aarch64-apple-darwin.tar.gz"
      sha256 "a5269f93796fccab89629467625e26e19b9d03bcc242c62581e101a4364c881a"
    else
      url "https://github.com/BeckhamLabsLLC/HiveBear/releases/download/v#{version}/hivebear-x86_64-apple-darwin.tar.gz"
      sha256 "e4b07a572b57a7380c26af8d18f65903ef82f7646b95fc9705741a942f3a6dac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BeckhamLabsLLC/HiveBear/releases/download/v#{version}/hivebear-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f9e40aa0dbc1faed0aa61489e729fb8ffc5055a98a67d1c6cadc7fe1972a9c0b"
    else
      url "https://github.com/BeckhamLabsLLC/HiveBear/releases/download/v#{version}/hivebear-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6c58be72b308bb12e6b4195b78e3d6b4f280fe39deab756e43b7a6bac9b3cfa"
    end
  end

  def install
    bin.install "hivebear"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hivebear --version")
  end

  def caveats
    <<~EOS
      Get started with HiveBear:

        hivebear quickstart

      This will profile your hardware, recommend the best model,
      download it, and start an interactive chat session.
    EOS
  end
end
