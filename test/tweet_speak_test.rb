require 'contest'
class Test::Unit::TestCase

  class << self
    alias_method :it, :test
  end
end

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'tweet_speak'

class TweetSpeakTest < Test::Unit::TestCase

  it 'processes strings with .twittify' do
    assert TweetSpeak.respond_to?(:twittify)
  end
  
  describe '.twittify' do
    it 'accepts a string' do
      assert_nothing_raised do
        TweetSpeak.twittify('...')
      end
    end
    
    it 'complains when no argument given' do
      assert_raises ArgumentError do
        TweetSpeak.twittify()
      end
    end
    
    it 'reduces all multiple spaces to single spaces' do
      assert_equal 'what on earth?', TweetSpeak.twittify('what on  earth?')
    end
    
    it "changes tokens at the beginning of the string" do
      assert_equal 'u cool', TweetSpeak.twittify('you cool')
    end

    it "changes tokens in the middle of the string" do
      assert_equal 'hey u cool', TweetSpeak.twittify('hey you cool')
    end

    it "changes tokens at the end of the string" do
      assert_equal 'hey u', TweetSpeak.twittify('hey you')
    end

    it "changes all instances of 'you' to 'u'" do
      assert_equal 'what u doin youth?', TweetSpeak.twittify("what you doin youth?")
    end
  
    it "changes all instances of 'your' to 'ur'" do
      assert_equal 'ur best', TweetSpeak.twittify("your best")
    end

    it "changes all instances of 'you're' to 'ur'" do
      assert_equal 'ur the best', TweetSpeak.twittify("you're the best")
    end

    it "changes all instances of 'to' to '2'" do
      assert_equal '2 be or not 2 be too?', TweetSpeak.twittify("to be or not to be too?")
    end
    
    it "changes all instances of 'are' to 'r'" do
      assert_equal "r or aren't we cool?", TweetSpeak.twittify("are or aren't we cool?")
    end
  
    it "changes all instances of 'with' to 'w/'" do
      assert_equal "who am I w/?", TweetSpeak.twittify("who am I with?")
    end
  
    it "changes all instances of 'without' to 'w/o'" do
      assert_equal 'withholding w/o me?', TweetSpeak.twittify("withholding without me?")
    end
  
    it "changes all instances of 'because' to 'b/c'" do
      assert_equal 'b/c of me?', TweetSpeak.twittify("because of me?")
    end
  
    it "changes all instances of 'before' to 'b4'" do
      assert_equal 'b4 me?', TweetSpeak.twittify("before me?")
    end

    it "changes all instances of 'for' to '4'" do
      assert_equal 'forthright 4 life', TweetSpeak.twittify("forthright for life")
    end
  end
end
