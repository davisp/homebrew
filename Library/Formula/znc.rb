require 'brewkit'

class Znc <Formula
  @url='http://downloads.sourceforge.net/project/znc/znc/0.074/znc-0.074.tar.gz'
  @homepage='http://en.znc.in/wiki/ZNC'
  @md5='378187acd114769f8f97ef2d4b19da25'

  def deps
    LibraryDep.new 'c-ares'
  end

  def install
    # This is the module that handles push notifications for Colloquy on the iPhone
    # it's off by default, but a bitch to compile if you don't do it while the source is available
    system "curl -Ls -o modules/colloquy.cpp http://github.com/wired/colloquypush/raw/e678ca8ba9b3515dc8bfabeb7a6f258e6b8665e8/znc/colloquy.cpp"

    # Apparently Snow Leopard's libperl is at /System/Library/Perl/lib/5.10/libperl.dylib
    # but I don't know how to tell znc that. Perl is only used for user plugins, anyway.
    system "./configure", "--prefix=#{prefix}", "--disable-perl"
    system "make install"
  end

  def caveats
    "Modules don't load at runtime, with 'Symbol not found'.\n"+
    "If you can figure out how why, let me know at github.com/indirect"
    # Unable to load module [away] [dlopen(/usr/local/Cellar/znc/0.074/lib/znc/away.so, 6): Symbol not found: __ZN7CModule10ListTimersEv
    # Referenced from: /usr/local/Cellar/znc/0.074/lib/znc/away.so
    # Expected in: flat namespace
  end
end
