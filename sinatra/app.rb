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