require 'json'

class Blog

  attr_accessor :posts

  def initialize
    posts_file = File.read('posts.json')
    @posts = JSON.parse(posts_file)['posts']
  end

end