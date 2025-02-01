class Liblipgloss < Formula
  desc "C Wrapper for Lipgloss, a terminal UI styling library"
  homepage "https://github.com/Reonarudo/liblipgloss"
  url "https://github.com/Reonarudo/liblipgloss/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "62d98a4d68028b5cf8b9f10d50689689320249a8de5da1d186b18a7a13b676ca"
  license "MIT"

  depends_on "go" => :build

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"

    # Ensure Homebrew links correctly
    ENV["CFLAGS"] = "-I#{include}"
    ENV["LDFLAGS"] = "-L#{lib}"
  end

  test do
    system "test", "-f", "#{lib}/liblipgloss.dylib"
    system "pkg-config", "--exists", "liblipgloss"
  end
end