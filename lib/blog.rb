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

  def find_by_tag tag
    @posts.select { |post| post['tags'].split(',').map(&:strip).include? tag }
  end

  def summary id, len
    print @posts[id]['description'].split(' ').first(len).join(' ')
  end

end