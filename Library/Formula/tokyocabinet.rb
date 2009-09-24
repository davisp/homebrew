require 'brewkit'

class Tokyocabinet <Formula
  @url='http://1978th.net/tokyocabinet/tokyocabinet-1.4.33.tar.gz'
  @homepage=''
  @md5='d81c3b04921d189f843c64d56b81a8d4'
  @sha1='c3ded8ee0bde93f072b9436a6244dc7690abd5c6'

  def install
    system "./configure", "--prefix=#{prefix}", "--enable-fastest"
    system "make"
    system "make install"
  end
end
