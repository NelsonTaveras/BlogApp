require 'json'

class Blog

  attr_accessor :posts

  def initialize
    posts_file = File.read('posts.json')
    @posts = JSON.parse(posts_file)['posts']
  end

  def find_by_id id
    @posts.select { |post| post['id'].to_i == id }
  end

  def find_by_author author
    @posts.select { |post| post['author'] == author }
  end

end