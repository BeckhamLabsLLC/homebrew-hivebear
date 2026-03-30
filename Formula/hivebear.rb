class Hivebear < Formula
  desc "AI that fits your machine — run LLMs on any device regardless of GPU"
  homepage "https://hivebear.com"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BeckhamLabsLLC/HiveBear/releases/download/v#{version}/hivebear-aarch64-apple-darwin.tar.gz"
      sha256 "f14abfc505c060e4d7d29a8fe7cde239c45b98f3a7f31ad3d8c3cf555e1c3eb7"
    else
      url "https://github.com/BeckhamLabsLLC/HiveBear/releases/download/v#{version}/hivebear-x86_64-apple-darwin.tar.gz"
      sha256 "4ed8d96b1aee31716ebf6a986849ef4c491116fb1f97abe10d391bb09428ee92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BeckhamLabsLLC/HiveBear/releases/download/v#{version}/hivebear-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c3a688a38ffff96762a427c5daa7fd36bd0427ec679551561e793eb2f76ae516"
    else
      url "https://github.com/BeckhamLabsLLC/HiveBear/releases/download/v#{version}/hivebear-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee068614d7d40fdcae861c1a21c9da3d3483bfa1f9729a6d48b6f6f4c561db07"
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
