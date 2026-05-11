class Libavif < Formula
  desc "Library for encoding and decoding .avif files"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "d4aea31a4becb3273ba7968221be2e48148ba05eb8a68d14e671963e17785648"

  depends_on "cmake" => :build
  depends_on "aom"
  depends_on "dav1d"
  depends_on "svt-av1"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "tychoid/libavif/libyuv"

  def install
    args = %W[
      -DAVIF_CODEC_AOM=SYSTEM
      -DAVIF_CODEC_DAV1D=ON
      -DAVIF_CODEC_SVT=ON
      -DAVIF_LIBYUV=ON
      -DAVIF_BUILD_APPS=ON
      -DAVIF_BUILD_TESTS=OFF
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
      
    ]
    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
