class Libyuv < Formula
  desc "Library for YUV scaling and conversion"
  homepage "https://chromium.googlesource.com/libyuv/libyuv"
  url "https://chromium.googlesource.com/libyuv/libyuv.git",
      revision: "4b4e68b3"
  version "4b4e68b3"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
      "-DCMAKE_OSX_ARCHITECTURES=arm64",
      *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
