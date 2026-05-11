class Libavif < Formula
  desc "Library for encoding and decoding .avif files"
  homepage "https://github.com/AOMediaCodec/libavif"
  url "https://github.com/AOMediaCodec/libavif/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "914662e16245e062ed73f90112fbb4548241300843a7772d8d441bb6859de45b"

  depends_on "cmake" => :build
  depends_on "aom"
  depends_on "svt-av1"
  depends_on "jpeg-turbo"
  depends_on "libpng"

  def install
    args = %W[
      -DAVIF_CODEC_AOM=SYSTEM
      -DAVIF_CODEC_DAV1D=ON
      -DAVIF_CODEC_SVT=ON
      -DAVIF_LIBYUV=LOCAL
      -DAVIF_BUILD_APPS=ON
      -DAVIF_BUILD_TESTS=OFF
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
      
    ]
    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
