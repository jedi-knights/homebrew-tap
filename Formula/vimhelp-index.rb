class VimhelpIndex < Formula
  desc "Full-text index and search over vimdoc (:h)"
  homepage "https://github.com/jedi-knights/vimhelp-index"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/jedi-knights/vimhelp-index/releases/download/v0.1.0/vimhelp-index-aarch64-apple-darwin.tar.xz"
      sha256 "5a802e1d3036dad52b57c1ac57a17d9ada457b20f055878684df6709aab8e068"
    end
    if Hardware::CPU.intel?
      url "https://github.com/jedi-knights/vimhelp-index/releases/download/v0.1.0/vimhelp-index-x86_64-apple-darwin.tar.xz"
      sha256 "f33fa5883e0410d14748225b9c74c0f7d687952bfbf14811592951dba2e02249"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/jedi-knights/vimhelp-index/releases/download/v0.1.0/vimhelp-index-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8caae51fe782f4e0ab0be7c5f3a478c51900d3b2fe971d3d4e5180ba450c9f31"
    end
    if Hardware::CPU.intel?
      url "https://github.com/jedi-knights/vimhelp-index/releases/download/v0.1.0/vimhelp-index-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b061056e9b5aeb738e5cdac31184025b58b41225ca6945de423012e9331e42d3"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "vimhelp-index"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "vimhelp-index"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "vimhelp-index"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "vimhelp-index"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
