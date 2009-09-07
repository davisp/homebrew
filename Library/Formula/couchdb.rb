require 'brewkit'

class Couchdb <Formula
  @version='0.11.0'
  @url='git://git.apache.org/couchdb.git'
  @homepage='http://couchdb.apache.org/'

  def deps
     LibraryDep.new 'spidermonkey'
     LibraryDep.new 'icu4'
  end

  def install
    system "./bootstrap"
    system "./configure", "--prefix=#{prefix}", "ERLC_FLAGS=+native"
    system "make install"
    system "mkdir -p #{prefix}/var/{lib,log}/couchdb"
  end
end
