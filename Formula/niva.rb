class Niva < Formula
  desc "Text-based music engraving for jazz and pop lead sheets"
  homepage "https://github.com/nivatune/user"
  url "https://github.com/nivatune/user/releases/download/v0.2/niva-v0.2-universal-apple-darwin.tar.gz"
  sha256 "3836bd9013c4643f69668250247fc0e7838708245e00cca1475c2c1e3c5019db"
  license "MIT"
  version "0.2"

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
