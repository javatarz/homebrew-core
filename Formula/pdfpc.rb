class Pdfpc < Formula
  desc "Presenter console with multi-monitor support for PDF files"
  homepage "https://pdfpc.github.io/"
  url "https://github.com/pdfpc/pdfpc/archive/v4.3.2.tar.gz"
  sha256 "44b487ea207bac88364e136570d4d4baaec08cfd1388e3477fb52a36b6c57f29"
  head "https://github.com/pdfpc/pdfpc.git"

  bottle do
    sha256 "47adc3527b7db1f32aee5efc071e737db59e66d99fe6eb9207d58a6f95259348" => :mojave
    sha256 "84e7142812adbe4f04287236cd0b88084fff32bd0bbeef07fd487618b588276d" => :high_sierra
    sha256 "af761af075aa7a3231bb447726d949afaa7f9fe55f85d11eba75ce88d41ed809" => :sierra
  end

  depends_on "cmake" => :build
  depends_on "vala" => :build
  depends_on "gtk+3"
  depends_on "libgee"
  depends_on "librsvg"
  depends_on "poppler"

  def install
    system "cmake", ".", "-DMOVIES=off", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/pdfpc", "--version"
  end
end
