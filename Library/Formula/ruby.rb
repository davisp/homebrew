require 'brewkit'

class Ruby <Formula
  @url='ftp://ruby-lang.org/pub/ruby/ruby-1.8.7-p174.tar.gz'
  @homepage='http://www.ruby-lang.org/'
  @md5='18dcdfef761a745ac7da45b61776afa5'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make"
    system "make install"
  end
end
