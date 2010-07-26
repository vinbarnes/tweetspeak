Gem::Specification.new do |s|
  s.name = 'tweetspeak'
  s.version = '0.1.0'
  s.summary = 'Minify your tweet without obfuscating (too much).'
  s.description = s.summary + ' l33t txt shorthand replacements for everyday words.'
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">=1.8.6"
  
  s.author = "Kevin R. Barnes"
  s.email  = "vinbarnes@gmail.com"
  s.homepage = "http://github.com/vinbarnes/tweetspeak"
  
  s.files = Dir.glob("{bin,lib,test}/**/*") + %w(README.markdown)
  s.require_path = 'lib'
  s.has_rdoc = false
  s.test_files = "test/tweet_speak_test.rb"
  
  s.bindir = 'bin'
  s.executables << 'tweetspeak'
end
