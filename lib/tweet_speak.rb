class TweetSpeak
  SHORTHAND = {
    'are' => 'r',
    'you' => 'u',
    'your' => 'ur',
    "you're" => 'ur',
    'to' => '2',
    'because' => 'b/c',
    'before' => 'b4',
    'for' => '4',
    'with' => 'w/',
    'without' => 'w/o'
  }

  def self.twittify(tweet)
    regex = /(\W*)(#{SHORTHAND.keys.join('|')})(\W+|$)/i
    tweet.gsub(regex) do |match|
      $1 + SHORTHAND[$2] + $3
    end.gsub(/\s+/, ' ')
  end  
end
