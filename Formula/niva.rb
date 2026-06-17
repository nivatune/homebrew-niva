class Niva < Formula
  desc "Text-based music engraving for jazz and pop lead sheets"
  homepage "https://github.com/nivatune/user"
  url "https://github.com/nivatune/user/releases/download/v0.3.1/niva-v0.3.1-universal-apple-darwin.tar.gz"
  sha256 "fb0c633a8aab1d725a76185d72f41dea60cf90c4978e2a19760a4372b1e5efc0"
  license "MIT"
  version "0.3.1"

  def install
    # Keep the binary and libpdfium.dylib together so the dylib is found beside it.
    libexec.install Dir["niva", "libpdfium.dylib"]
    bin.install_symlink libexec/"niva"
  end

  test do
    system bin/"niva", "--version"
    (testpath/"t.niva").write("title Test\n| Cmaj7 ||\n")
    system bin/"niva", "render", "t.niva"
    assert_predicate testpath/"t.pdf", :exist?
  end
end
