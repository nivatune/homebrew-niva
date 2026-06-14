class Niva < Formula
  desc "Text-based music engraving for jazz and pop lead sheets"
  homepage "https://github.com/nivatune/user"
  url "https://github.com/nivatune/user/releases/download/v0.2.1/niva-v0.2.1-universal-apple-darwin.tar.gz"
  sha256 "50c421619367c6548785bdcfc36fd847d52785443c607207822d83d45c249839"
  license "MIT"
  version "0.2.1"

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
