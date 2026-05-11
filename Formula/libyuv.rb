class Libyuv < Formula
  desc "Library for YUV scaling and conversion"
  homepage "https://chromium.googlesource.com/libyuv/libyuv"
  url "https://chromium.googlesource.com/libyuv/libyuv.git",
      revision: "4b4e68b3"
  version "4b4e68b3"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build",
      "-DCMAKE_CXX_FLAGS=-DLIBYUV_DISABLE_SVE -DLIBYUV_DISABLE_SME -DLIBYUV_DISABLE_I8MM",
      "-DCMAKE_C_FLAGS=-DLIBYUV_DISABLE_SVE -DLIBYUV_DISABLE_SME -DLIBYUV_DISABLE_I8MM",
      *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
