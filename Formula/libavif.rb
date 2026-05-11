class Libavif < Formula
  desc "Library for encoding and decoding .avif files"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "" # fill in after downloading

  depends_on "cmake" => :build
  depends_on "aom"
  depends_on "svt-av1"
  depends_on "jpeg-turbo"

  def install
    args = %W[
      -DAVIF_CODEC_AOM=ON
      -DAVIF_CODEC_SVT=ON
      -DAVIF_BUILD_APPS=ON
      -DAVIF_LIBYUV=OFF
    ]
    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
