class Libyuv < Formula
  desc "Library for YUV scaling and conversion"
  homepage "https://chromium.googlesource.com/libyuv/libyuv"
  url "https://chromium.googlesource.com/libyuv/libyuv.git",
      branch: "stable"
  version "stable"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
      "-DCMAKE_POLICY_VERSION_MINIMUM=3.5",
      *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
