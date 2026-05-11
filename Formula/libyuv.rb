class Libyuv < Formula
  desc "Library for YUV scaling and conversion"
  homepage "https://chromium.googlesource.com/libyuv/libyuv"
  url "https://chromium.googlesource.com/libyuv/libyuv.git",
      revision: "stable"
  version "stable"

  depends_on "cmake" => :build

  def install
    ENV.append "CXXFLAGS", "-mno-i8mm"
    ENV.append "CFLAGS", "-mno-i8mm"

    system "cmake", "-S", ".", "-B", "build",
      "-DCMAKE_CXX_FLAGS=-DLIBYUV_DISABLE_SVE -DLIBYUV_DISABLE_SME",
      "-DCMAKE_C_FLAGS=-DLIBYUV_DISABLE_SVE -DLIBYUV_DISABLE_SME",
      *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
