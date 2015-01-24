require 'sinatra'
require_relative '../lib/blog.rb'
require 'sass/plugin/rack'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

def app
  Sinatra::Application
end

# Instance of the Blog class which will be used to answer requests.
blog = Blog.new

# Index
get '/' do
  "Index Page"
end

# Posts by ID
get '/posts/:id' do
  id = params[:id].to_i
  @posts = blog.find_by_id(id)
  erb :index
end

# Posts by Author
get '/author/:author' do
  author = params[:author].to_str
  @posts = blog.find_by_author(author)
  erb :index
end

# Posts by Tag
get '/tags/:tag' do
  tag = params[:tag].to_str
  @posts = blog.find_by_tag(tag)
  erb :index
end