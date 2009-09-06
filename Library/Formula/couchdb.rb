require 'brewkit'

class Couchdb <Formula
  @version='0.11.0'
  @url='git://git.apache.org/couchdb.git'
  @homepage='http://couchdb.apache.org/'

  def deps
     LibraryDep.new 'spidermonkey'
     LibraryDep.new 'icu4'
  end

  def patches
      base = "https://issues.apache.org/jira/secure"
      ["#{base}/attachment/12418738/no-js-for-driver.patch"]
  end

  def install
    system "./bootstrap"
    system "./configure", "--prefix=#{prefix}", "ERLC_FLAGS=+native"
    system "make install"
  end
end
