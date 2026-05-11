class Libyuv < Formula
  desc "Library for YUV scaling and conversion"
  homepage "https://chromium.googlesource.com/libyuv/libyuv"
  url "https://chromium.googlesource.com/libyuv/libyuv.git",
      revision: "stable"
  version "stable"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
      "-DCMAKE_CXX_FLAGS=-DLIBYUV_DISABLE_SVE -DLIBYUV_DISABLE_SME -mno-i8mm -mno-dotprod",
      "-DCMAKE_C_FLAGS=-DLIBYUV_DISABLE_SVE -DLIBYUV_DISABLE_SME -mno-i8mm -mno-dotprod",
      "-DCMAKE_OSX_ARCHITECTURES=arm64",
      *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
