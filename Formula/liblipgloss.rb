class Liblipgloss < Formula
  desc "C Wrapper for Lipgloss, a terminal UI styling library"
  homepage "https://github.com/Reonarudo/liblipgloss"
  url "https://github.com/Reonarudo/liblipgloss/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "453d2bae9ec6d7b32c8aa3ea8edfa6e0882cdd6bdec70df383e32774c6ab7e63"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_CFLAGS"] = "-I#{include}"
    system "make"
    lib.install "liblipgloss.dylib" # Libraries go to lib, not bin
    include.install Dir["include/*.h"]
  end

  test do
    system "test", "-f", "#{lib}/liblipgloss.dylib"
  end
end