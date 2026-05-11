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

  resource "libargparse" do
    url "https://github.com/kmurray/libargparse/archive/ee74d1b53bd680748af14e737378de57e2a0a954.tar.gz"
    sha256 "7727b0498851e5b6a6fcd734eb667a8a231897e2c86a357aec51cc0664813060"
  end

  def install
    resource("libargparse").unpack(buildpath/"ext/libargparse")

    args = %W[
      -DCMAKE_INSTALL_RPATH=#{rpath}
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5
      -DAVIF_CODEC_AOM=SYSTEM
      -DAVIF_CODEC_DAV1D=SYSTEM
      -DAVIF_CODEC_SVT=SYSTEM
      -DAVIF_BUILD_APPS=ON
      -DAVIF_BUILD_EXAMPLES=OFF
      -DAVIF_BUILD_TESTS=OFF
      -DAVIF_LIBYUV=SYSTEM
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
end
