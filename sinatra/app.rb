require 'sinatra'
require_relative '../lib/blog.rb'

blog = Blog.new

get '/' do
  erb :index
end

get '/posts/:id' do
  id = params[:id].to_i
  @posts = blog.find_by_id(id)
  erb :index
end

get '/author/:author' do
  author = params[:author].to_str
  @posts = blog.find_by_author(author)
  erb :index
end

get '/tags/:tag' do
  tag = params[:tag].to_str
  @posts = blog.find_by_tag(tag)
  erb :index
end