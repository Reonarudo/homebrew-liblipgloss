class Liblipgloss < Formula
  desc "C Wrapper for Lipgloss, a terminal UI styling library"
  homepage "https://github.com/Reonarudo/liblipgloss"
  url "https://github.com/Reonarudo/liblipgloss/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "10dc49309cd23d799095a873531c346ae50fc1fd898993abc7d9f200e2bd5a32"
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