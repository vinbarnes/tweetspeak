require 'contest'
class Test::Unit::TestCase

  class << self
    alias_method :it, :test
  end
end

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'tweet_speak'
