require 'brewkit'

class Postgresql <Formula
  @url='http://wwwmaster.postgresql.org/redir/198/h/source/v8.4.0/postgresql-8.4.0.tar.bz2'
  @homepage='http://www.postgresql.org/'
  @md5='1f172d5f60326e972837f58fa5acd130'

  def install

    configure_args = [
        "--with-bonjour",
        "--with-python",
        "--with-perl",
        "--with-gssapi",
        "--with-krb5",
        "--with-openssl",
        "--with-libxml",
        "--with-libxslt",
        "--prefix=#{prefix}",
        "--disable-debug",
        "--disable-dependency-tracking"
    ]

    system "./configure", *configure_args
    system "make install"
  end
end
