require 'formula'

class Nspr <Formula
  @url='https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.7.6/src/nspr-4.7.6.tar.gz'
  @homepage='http://www.mozilla.org/projects/nspr/'
  @md5='c78384602b4b466081a55025446641db'

  def install
    require 'hardware'

    ENV.gcc_4_2
    ENV.deparallelize
    Dir.chdir "mozilla/nsprpub" do
      frameworks = "-framework Carbon"
      frameworks = "" if MACOS_VERSION >= 10.6
      inreplace "pr/src/Makefile.in", "-framework CoreServices -framework CoreFoundation", frameworks

      conf = %W[--prefix=#{prefix} --disable-debug --enable-strip --enable-optimize]
      conf << "--enable-64bit" if Hardware.is_64_bit? and MACOS_VERSION >= 10.6
      system "./configure", *conf

      inreplace "config/autoconf.mk", "-install_name @executable_path/$@ ", ""

      system "make"
      system "make install"
    end
  end
end
