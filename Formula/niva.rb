class Niva < Formula
  desc "Text-based music engraving for jazz and pop lead sheets"
  homepage "https://github.com/nivatune/user"
  url "https://github.com/nivatune/user/releases/download/v0.4/niva-v0.4-universal-apple-darwin.tar.gz"
  sha256 "4298a86b1c3ab289f9495eeed9f784e61a36143c69c6bbae177738e19917c140"
  license "MIT"
  version "0.4"

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
